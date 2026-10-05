# Claude Code Adapter

This adapter describes how to expose the canonical skill to Claude Code without creating a second editable source.

## Authoritative source

```text
skills/evidence-based-change-review/
```

Do not edit a runtime copy independently.

## Claude Code discovery location

Current Claude documentation supports project-scoped custom Skills at:

```text
.claude/skills/<skill-name>/SKILL.md
```

and personal Skills at:

```text
~/.claude/skills/<skill-name>/SKILL.md
```

For this experiment, use **project scope** so the installation is tied to the test repository.

Reference: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview

## Initial installation options

### Preferred when supported: filesystem link

Expose the canonical directory at:

```text
.claude/skills/evidence-based-change-review
```

with a filesystem link to:

```text
../../skills/evidence-based-change-review
```

from the `.claude/skills` directory.

Verify that the actual Claude Code environment follows the link before relying on this method.

### Fallback: generated runtime copy

If the runtime or operating system does not support the link reliably:

1. copy the canonical skill directory to `.claude/skills/evidence-based-change-review`;
2. treat the copy as generated output;
3. record the source commit used;
4. never edit the generated copy directly;
5. replace the copy from canonical source for every update.

Do not create a separately maintained Claude-specific SKILL.md unless testing demonstrates a necessary behavioral incompatibility.

## Verification

Start a fresh Claude Code session if needed for discovery.

Run:

- at least two **Should activate** cases;
- at least two **Should not activate** cases;
- behavior cases B2, B6, and B7;
- the update and rollback procedure.

Record observed results in the experiment notes; do not report file presence as behavioral success.

## Failure behavior

If Claude Code does not discover the canonical skill through the chosen install mechanism:

- report the actual loading failure;
- test the fallback installation method;
- do not rewrite the canonical skill solely to mask an installation problem.

## Rollback

Restore the prior canonical source revision, reinstall/relink as needed, start a fresh session when discovery occurs only at startup, and repeat the affected evaluation cases.
