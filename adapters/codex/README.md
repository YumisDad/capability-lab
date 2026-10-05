# Codex Adapter

This adapter describes how to expose the canonical skill to Codex without maintaining a second skill definition.

## Authoritative source

```text
skills/evidence-based-change-review/
```

Do not edit a runtime copy independently.

## Codex discovery location

Current OpenAI guidance supports repository-scoped Skills at:

```text
.codex/skills/<skill-name>/SKILL.md
```

and user-scoped Skills at:

```text
~/.codex/skills/<skill-name>/SKILL.md
```

For this experiment, use **repository scope**.

References:
- https://developers.openai.com/blog/eval-skills
- https://developers.openai.com/api/docs/guides/tools-skills

## Initial installation options

### Preferred when supported: filesystem link

Expose the canonical directory at:

```text
.codex/skills/evidence-based-change-review
```

with a filesystem link to:

```text
../../skills/evidence-based-change-review
```

from the `.codex/skills` directory.

Verify that the actual Codex environment follows the link before relying on this method.

### Fallback: generated runtime copy

If the runtime or operating system does not support the link reliably:

1. copy the canonical skill directory to `.codex/skills/evidence-based-change-review`;
2. treat the copy as generated output;
3. record the source commit used;
4. never edit the generated copy directly;
5. replace it from canonical source for every update.

Do not create a separately maintained Codex-specific SKILL.md unless testing demonstrates a necessary incompatibility.

## Verification

Use a fresh Codex session where required for skill discovery.

Automatic-discovery tests must not explicitly invoke `$evidence-based-change-review`.

Run:

- at least two **Should activate** cases;
- at least two **Should not activate** cases;
- behavior cases B2, B6, and B7;
- the update and rollback procedure.

Explicit invocation may be tested separately to distinguish "skill can load" from "model selects it appropriately."

## Failure behavior

If Codex does not discover the skill through the chosen installation mechanism:

- report the actual loading failure;
- test the fallback installation method;
- do not weaken activation criteria merely to make an installation test pass.

## Rollback

Restore the prior canonical source revision, reinstall/relink as needed, start a fresh session when discovery state is cached, and repeat the affected evaluation cases.
