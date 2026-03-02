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

# ── Parse JSON fields ────────────────────────────────────────────────────────
model=$(echo "$input"         | jq -r '.model.display_name // empty')
ctx_size=$(echo "$input"      | jq -r '.context_window.context_window_size // 200000')
cwd=$(echo "$input"           | jq -r '.workspace.current_dir // .cwd // empty')

# Use pre-calculated used_percentage (identical to what /context displays).
# Falls back to null/empty when no messages have been exchanged yet.
used_pct_raw=$(echo "$input"  | jq -r '.context_window.used_percentage // empty')

# Current context window token usage (matches /context "tokens used" figure).
# /context counts input_tokens + cache_read_input_tokens + cache_creation_input_tokens.
# input_tokens alone is only the non-cached portion (can be very small), which is why
# we must sum all three fields to reproduce the number shown by /context.
current_input=$(echo "$input" | jq -r '
  (.context_window.current_usage | if . == null then 0 else
    ((.input_tokens // 0) + (.cache_read_input_tokens // 0) + (.cache_creation_input_tokens // 0))
  end)
')

# ── Percentage (0-100) ────────────────────────────────────────────────────────
if [ -n "$used_pct_raw" ] && [ "$ctx_size" -gt 0 ] 2>/dev/null; then
  # Round to nearest integer for the bar and integer display.
  used_pct_int=$(awk "BEGIN { printf \"%d\", int($used_pct_raw + 0.5) }")
  used_pct=$(awk "BEGIN { printf \"%.1f\", $used_pct_raw }")
else
  used_pct="0.0"
  used_pct_int=0
fi

# ── Format large numbers with k/M suffix ─────────────────────────────────────
fmt_tokens() {
  local n="${1:-0}"
  if awk "BEGIN { exit !($n >= 1000000) }" 2>/dev/null; then
    awk "BEGIN { printf \"%.1fM\", $n/1000000 }"
  elif awk "BEGIN { exit !($n >= 1000) }" 2>/dev/null; then
    awk "BEGIN { printf \"%.1fk\", $n/1000 }"
  else
    printf "%s" "$n"
  fi
}

cum_fmt=$(fmt_tokens "$current_input")
ctx_fmt=$(fmt_tokens "$ctx_size")

# ── Progress bar (20 chars wide) ─────────────────────────────────────────────
BAR_WIDTH=20
filled=$(awk "BEGIN { n=int(($used_pct_int/100)*$BAR_WIDTH); if(n>$BAR_WIDTH) n=$BAR_WIDTH; printf \"%d\", n }")
empty=$(( BAR_WIDTH - filled ))

bar="${C_BAR_BRACKET}[${RESET}"
i=0
while [ $i -lt "$filled" ]; do bar="${bar}${C_BAR_FILL}#${RESET}"; i=$(( i + 1 )); done
while [ $i -lt "$BAR_WIDTH" ]; do bar="${bar}${C_BAR_EMPTY}-${RESET}"; i=$(( i + 1 )); done
bar="${bar}${C_BAR_BRACKET}]${RESET}"

# ── Git branch ───────────────────────────────────────────────────────────────
if [ -n "$cwd" ]; then
  git_branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
else
  git_branch=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
fi

# ── Assemble output ──────────────────────────────────────────────────────────
SEP="${C_SEP} | ${RESET}"
out=""

# 1. Model name
[ -n "$model" ] && out="${BOLD}${C_MODEL}${model}${RESET}"

# 2. Progress bar with percentage and token counts
out="${out}${SEP}${bar} ${C_PCT}${used_pct_int}%${RESET} ${C_TOKENS}(${cum_fmt}/${ctx_fmt})${RESET}"

# 3. Git branch (only when inside a git repo)
[ -n "$git_branch" ] && out="${out}${SEP}${C_BRANCH}${git_branch}${RESET}"

printf "%b\n" "$out"
