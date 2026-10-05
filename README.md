# capability-lab

Private-by-intent experimental repository for testing reusable AI capabilities across multiple agent runtimes.

> **Current repository visibility note:** keep all committed material generic and non-sensitive. Do not add credentials, private case data, employer data, Gmail exports, or private Notion content.

## Current objective

Determine whether one authoritative Agent Skill can be reliably discovered, invoked, evaluated, updated, and rolled back across Claude Code and Codex without requiring duplicate maintenance.

## Design principles

- One editable authority per capability.
- Skills before subagents when reusable procedure is enough.
- Deterministic checks outside model judgment where practical.
- Platform-specific adapters stay thin and non-authoritative.
- No production credentials or private case data.
- Evaluate behavior, not just file compatibility.
- Prefer the smallest dependable intervention.
- Preserve rollback and explicit version state.
- Treat runtime installation as distinct from source approval.
- Do not assume a skill is effective because its files load.

## Authoritative layout

```text
skills/
  evidence-based-change-review/
    SKILL.md
    references/
      review-criteria.md

evals/
  evidence-based-change-review/
    activation-cases.md
    behavior-cases.md
    expected-properties.md

adapters/
  claude/
  codex/
```

The canonical skill under `skills/` is the **sole editable authority**. Runtime-specific locations under `.claude/skills/` or `.agents/skills/` for Codex are installation targets, not separately maintained sources. The original Codex adapter used `.codex/skills/`; the [2026-10-05 Codex runtime record](results/evidence-based-change-review/codex/2026-10-05.md) documents the observed discovery path and its limits.

## First experiment

### `evidence-based-change-review`

This experiment tests:

- automatic discovery;
- correct invocation;
- correct non-invocation;
- evidence discipline;
- adversarial input handling;
- missing-resource behavior;
- behavior across Claude Code and Codex;
- update propagation;
- rollback;
- operator burden.

### Promotion criterion

Do not promote this repository into a broader capability platform merely because the skill works once. Promotion requires evidence that shared maintenance reduces user effort and preserves important behavior across both target runtimes better than simpler project instructions.

### Explicitly out of scope for this experiment

- live credentials;
- Gmail or Notion access;
- production systems;
- MCP servers;
- model APIs;
- persistent agents/subagents;
- unattended automation;
- private career or workplace data.

## Working model

1. Edit only the canonical skill source.
2. Install or expose that source to one target runtime.
3. Run the shared evaluation cases.
4. Repeat independently in the other runtime.
5. Compare observed behavior and operator effort.
6. Test an update and rollback.
7. Decide whether shared capability management has earned further investment.

## Change discipline

Use experiment branches and draft pull requests. Do not use `main` as a scratchpad. Keep failed or ambiguous results in the experiment record rather than reporting only successful runs.
