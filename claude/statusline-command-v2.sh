#!/usr/bin/env bash
# Claude Code status line script
# Format: model | [##------------------] 11% (22k/200k) | git-branch
#
# Percentage = pre-calculated used_percentage from Claude Code (matches /context output)
# Token count = sum of current_usage.input_tokens + cache_read_input_tokens + cache_creation_input_tokens (matches /context output)

input=$(cat)

# ── ANSI color codes (256-color) ─────────────────────────────────────────────
RESET="\033[0m"
BOLD="\033[1m"
C_MODEL="\033[38;5;75m"       # Soft sky-blue  - model name
C_BAR_FILL="\033[38;5;83m"    # Bright green   - filled bar blocks
C_BAR_EMPTY="\033[38;5;238m"  # Dark grey      - empty bar blocks
C_BAR_BRACKET="\033[38;5;244m" # Mid grey      - [ ] brackets
C_PCT="\033[38;5;220m"        # Amber/yellow   - percentage number
C_TOKENS="\033[38;5;244m"     # Grey           - (used/total) token counts
C_BRANCH="\033[38;5;213m"     # Orchid/pink    - git branch name
C_SEP="\033[38;5;240m"        # Dim grey       - separators

# ── Parse JSON fields (optimized: single jq call) ────────────────────────────
model=$(jq -r '.model.display_name // empty' <<< "$input")
ctx_size=$(jq -r '.context_window.context_window_size // 200000' <<< "$input")
cwd=$(jq -r '.workspace.current_dir // .cwd // empty' <<< "$input")
used_pct_raw=$(jq -r '.context_window.used_percentage // empty' <<< "$input")
current_input=$(jq -r '
  (.context_window.current_usage | if . == null then 0 else
    ((.input_tokens // 0) + (.cache_read_input_tokens // 0) + (.cache_creation_input_tokens // 0))
  end)
' <<< "$input")

# ── Percentage (0-100) ────────────────────────────────────────────────────────
if [ -n "$used_pct_raw" ] && (( ctx_size > 0 )); then
  # Combined calculation in single awk call
  used_pct_int=$(awk -v pct="$used_pct_raw" 'BEGIN { int_pct = int(pct + 0.5); if (int_pct > 100) int_pct = 100; printf "%d", int_pct }')
  used_pct=$(awk -v pct="$used_pct_raw" 'BEGIN { printf "%.1f", pct }')
else
  used_pct="0.0"
  used_pct_int=0
fi

# ── Format large numbers with k/M suffix ─────────────────────────────────────
fmt_tokens() {
  awk -v n="$1" 'BEGIN {
    if (n >= 1000000) printf "%.1fM", n / 1000000
    else if (n >= 1000) printf "%.1fk", n / 1000
    else printf "%d", n
  }'
}

cum_fmt=$(fmt_tokens "$current_input")
ctx_fmt=$(fmt_tokens "$ctx_size")

# ── Progress bar (20 chars wide, optimized without loops) ───────────────────
BAR_WIDTH=20
filled=$(awk -v pct="$used_pct_int" 'BEGIN { n = int((pct/100)*20); if (n > 20) n = 20; printf "%d", n }')
empty=$(( BAR_WIDTH - filled ))

bar="${C_BAR_BRACKET}[${RESET}"
if (( filled > 0 )); then
  bar+=$(printf "${C_BAR_FILL}#%.0s" $(seq 1 "$filled"))
  bar+="${RESET}"
fi
if (( empty > 0 )); then
  bar+=$(printf "${C_BAR_EMPTY}-%.0s" $(seq 1 "$empty"))
  bar+="${RESET}"
fi
bar+="${C_BAR_BRACKET}]${RESET}"

# ── Git branch ───────────────────────────────────────────────────────────────
if [ -n "$cwd" ]; then
  git_branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
else
  git_branch=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
fi

# ── Assemble output ──────────────────────────────────────────────────────────
SEP="${C_SEP} | ${RESET}"
out=""

[ -n "$model" ] && out="${BOLD}${C_MODEL}${model}${RESET}"
out="${out}${SEP}${bar} ${C_PCT}${used_pct_int}%${RESET} ${C_TOKENS}(${cum_fmt}/${ctx_fmt})${RESET}"
[ -n "$git_branch" ] && out="${out}${SEP}${C_BRANCH}${git_branch}${RESET}"

printf "%b\n" "$out"
