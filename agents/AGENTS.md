# Agent Guidelines

## Working With Multiple Coding Agents

- Work is carried out interchangeably by different coding agents (Claude Code, Gemini CLI, etc.). Any agent may pick up where another stopped, and none can see another's conversation history.
- The files on disk are the only shared memory: specs, plans, decision logs, and RCAs must be written to the paths below and must be complete enough for a different agent to continue without prior context.
- Use the Superpowers skills strictly, as described below. If your tool has no skill-invocation mechanism, locate the skill's `SKILL.md` and follow it as written.
- Before starting, read the latest relevant files in `docs/` to understand the current state. After completing a step, update the plan to reflect progress.
- **Use Mermaid diagrams, never ASCII diagrams, in documentation files** (specs, plans, RCAs, decision logs, READMEs, and other markdown files on disk).
- **Use ASCII diagrams, never Mermaid, in terminal (TUI) output** from coding agents. Agents cannot render Mermaid in the terminal, so diagrams shown in chat (e.g., during brainstorming) must be plain-text ASCII.

## Superpowers Core Workflows

- **Always write specifications to disk** using the `brainstorming` skill. File path: `docs/specs/YYYY-MM-DD-<topic>-design.md`
- **Always write implementation plans to disk** using the `writing-plans` skill before writing code. File path: `docs/plans/YYYY-MM-DD-<feature-name>.md`
- **Always debug and fix issues** using the `systematic-debugging` skill and **always write the RCA (Root Cause Analysis) to disk**. File path: `docs/bugs/YYYY-MM-DD-<bug-name>.md`
- Never skip the physical filesystem write step or store specs, plans, and RCAs solely in tool memory or temporary agent states.
- **Do not use the brainstorming visual companion** (the browser-based mockup tool) and do not offer it. Keep brainstorming in the terminal and display diagrams as ASCII; written specs use Mermaid.
- **Execute plans inline with executing-plans** Do not ask which execution approach to use. Use `subagent-driven-development` only when the user explicitly asks for it.
- **Leave no deferred minors.** Every finding in the final review enters the fix pass, Minors included (overrides the skill's defer rule). Each fix requires a failing test first (for doc/wording fixes: an automated check). Unfixed findings require a `Ruling:` in the plan's Results. Record behavior-changing fixes in an RCA (`docs/bugs/`).
- **Never ask which execution approach to use** when a plan is finished—inline execution via `executing-plans` is mandatory. Confirm the plan is saved and prompt the user for review.
- **Always tick the plan's progress checkboxes during execution.** Mark each step `- [x]` in its corresponding commit (or docs commit at task end), never in a single batch. A skipped or changed step remains unticked with an explanation in Results.
- **Automatically archive completed specs and plans.** When an implementation plan is executed, verified, its Results section completed, and committed, move both the plan and its design spec to `docs/archive/plans/` and `docs/archive/specs/` using `git mv` (create destination directories if needed). Active docs remain in `docs/{specs,plans}/`.
- **Automatically archive completed RCAs.** Move RCAs in `docs/bugs/` to `docs/archive/bugs/` using `git mv` once the fix is verified, committed, and merged into the primary branch.
- **Keep a global decision log per agent session** in `docs/logs/YYYY-MM-DD-decision-log.md`. Append an entry after each Q&A during brainstorming (fields: feature, question, options, answer, rationale). Append a new session heading if the file exists. Reference this log from the specs it informed.
- **Before every commit:** run `bun fmt` (options in the root `bunfig.toml` `[fmt]`; change formatter options only with the user's approval). Never commit unformatted files. If `bun fmt` changes any file, stage those changes and include them in the same commit.
- **Before claiming work is done** (see `verification-before-completion`): run `bun check` across all workspaces. Fix every type error before proceeding — never bypass the check. Only after `bun check` exits 0 may a coding agent report the task complete, merge into `main`, or push to `main`.

## Safety

- Ask before destructive or hard-to-reverse actions: deleting directories, force-pushing, rewriting history, dropping databases, or pruning container/infrastructure resources.
- Exception: scratch files under `.superpowers/` (ledgers, traces, logs, probe scripts) of a completed task may be deleted without asking. Ensure any long-term context is documented in the plan's Results or RCA before deletion.
- **Commit as the Superpowers skills direct:** commit specs, plans, and RCAs when written, and commit each plan task as completed. This rule explicitly overrides any agent default preventing commits without user prompting. Pushing, force-pushing, and history rewrites still require explicit user approval.

## Commits

- Use Conventional Commits: `<type>(<scope>): <summary>`.
- Types: `feat`, `fix`, `docs`, `refactor`, `test`, `build`, `chore`, `perf`.
- Summary in imperative mood, lowercase, no trailing period. Mark breaking changes with `!` or a `BREAKING CHANGE:` footer.
- Commit author name and email must come from global git config (`git config --global user.name` / `user.email`). Never fabricate, hard-code, or override them with `--author` or repo-local config without user instruction.
- Keep each commit focused on one logical change.

## CLI Tool Rules

- Write each tool as a TypeScript library first (exporting a typed programmatic API) and compile it to a standalone CLI, improving code reuse and tool composition across agent loops, benchmarks, and test suites.
- CLI tools must adhere to GNU/POSIX conventions: kebab-case long options (`--tolerance`), standard single-letter short options (`-t`), standard exit codes (0 for success/match, 1 for mismatch/rejection, 2 for usage/operational errors), structured text default output without TUI animation noise, and an optional `--json` flag for machine parsing.
- **Design and implement every CLI's argument parser against all 14 POSIX.1-2017 Utility Syntax Guidelines (§12.2)**, not just the GNU subset above. In particular, Guideline 10 (the `--` end-of-options delimiter) and Guideline 13 (bare `-` for stdin/stdout) are easy to miss and must each have a passing test in the tool's arg-parser test suite.
- CLIs accept piped input and write piped output by default, with no `-o` needed: piped stdin (or `-`) is the input, the main output goes to stdout and the report to stderr, so tools chain as `a | b | c`. Writing binary output to a terminal is refused (exit 2). `-o <file>` stays available. A tool that reads several inputs takes all but one as file arguments; the last may come from stdin.
- Cap piped stdin at a project-appropriate limit. Input over the cap, or empty where input is required, exits 2 with a message. Files given as arguments are never capped.
- Every CLI's `--help` follows one layout: `USAGE`, `DESCRIPTION`, `INPUT`, `OUTPUT`, tool-specific option groups, `GENERAL`, `EXIT CODES`, `EXAMPLES`; options at column 3, descriptions at column 33, at most 100 characters per line. Every CLI has `--version`, printing `<tool> <version> (<build commit>)`.
- Every CLI provides `--agent-help` (structured markdown guidance for LLM coding agents), output to stdout with exit code 0. List it in `--help` under `GENERAL:` and validate it in the tool's test suite.
- Every tool must have a `DESIGN.md` explaining its internal architecture, pipeline (with Mermaid diagrams), module responsibilities, invariants, memory lifecycle, and measured performance for readers learning the techniques or modifying the code. The tool's `README.md` must link to it (`Internals for learning: [DESIGN.md](DESIGN.md)`). Implementation plans creating a tool must include a dedicated step to write `DESIGN.md`.
