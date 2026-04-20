# Agent orchestration

## User pacing

When the user asks to address issues "one by one" (or equivalent wording), treat that as an instruction to:
1. investigate or identify only the next issue,
2. explain the proposed next change,
3. and wait for user approval before making that change.

## Bead pacing

Unless the user explicitly instructs otherwise, stop after completing a bead.

After finishing a bead:
1. report what changed,
2. report what verification was run and the result,
3. encourage the user to commit the changes,
4. and wait for explicit user approval before starting the next bead.

Do not automatically continue to the next bead just because it is ready, related, or part of the same handoff, epic,
or workstream.

## Red-test and scaffolding beads

When verifying a bead whose purpose is to add red tests, contract-locking tests, helpers, or other scaffolding before
later implementation beads:
- read enough bead/epic/plan context to understand which production work is intentionally deferred to later beads,
- judge success primarily by whether the intended tests/helpers were added and whether the remaining failures are
  explained by that deferred implementation,
- treat only accidental regressions, broken test scaffolding, or failures that contradict the bead's stated scope as
  blockers,
- and do not broaden the work into implementation or extra test cleanup without explicit user approval.

## Subagents

For tasks involving more files throughout the codebase, use subagents intelligently, e.g. one agent per module.
When using subagents, don't run verification commands (compile, lint) inside them; run them in the main agent after
the subagents finish.

## Skills

When looking for skills, look for the `.agents` dir in the project root and in the current user's home directory.

## Context-window risk and handoffs

When the conversation becomes large or context-heavy, proactively warn the user when you suspect the remaining context
window is entering a risky zone. Treat this as a heuristic judgment, not an exact measurement.

Prefer warning at a clean checkpoint rather than in the middle of a small edit/validation loop. When warning, briefly:
- say that context risk appears to be increasing,
- suggest a good handoff point or fresh-session boundary,
- and offer a compact resume prompt or summary if helpful.

If there are important learnings, decisions, caveats, or next-step recommendations that are not yet persisted in code,
docs, or beads, suggest creating a short handoff document under `docs/handoffs/` when that would make the next
session safer or more efficient.
