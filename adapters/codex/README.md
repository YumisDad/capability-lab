# Codex Adapter

This adapter describes how to expose the canonical skill to Codex without maintaining a second skill definition.

## Authoritative source

```text
skills/evidence-based-change-review/
```

Do not edit a runtime copy independently.

## Codex discovery location

On 2026-10-05, current OpenAI guidance and a Codex CLI 0.160.0 prompt diagnostic supported repository-scoped discovery at:

```text
.agents/skills/<skill-name>/SKILL.md
```

and user-scoped Skills at:

```text
~/.agents/skills/<skill-name>/SKILL.md
```

For this experiment, use **repository scope**. The user-scoped location is documented, not tested here. The original adapter named `.codex/skills`; compatibility with that older location was not tested. Fresh desktop-chat behavior was also not tested. See the [runtime evidence](../../results/evidence-based-change-review/codex/2026-10-05.md).

References:
- https://learn.chatgpt.com/docs/build-skills (current discovery guidance, accessed 2026-10-05)
- https://developers.openai.com/blog/eval-skills
- https://developers.openai.com/api/docs/guides/tools-skills

## Initial installation options

### Preferred when supported: filesystem link

Expose the canonical directory at:

```text
.agents/skills/evidence-based-change-review
```

with a filesystem link to:

```text
../../skills/evidence-based-change-review
```

from the `.agents/skills` directory.

Verify that the actual Codex environment follows the link before relying on this method.

On the tested Windows host, SymbolicLink creation required administrator privilege. A directory junction worked without that privilege and was followed by Codex discovery:

```powershell
# Run from the repository root, only when the exposure does not already exist.
New-Item -ItemType Directory -Path '.agents/skills' -Force
New-Item -ItemType Junction -Path '.agents/skills/evidence-based-change-review' -Target (Resolve-Path 'skills/evidence-based-change-review').Path
```

Keep this machine-local junction out of version control. The experiment used a local `.git/info/exclude` entry for `/.agents/skills/`. Recreate it for each checkout; do not commit its absolute target path or assume cross-machine portability. Compare exposed and canonical file hashes, then use a fresh runtime diagnostic/session to establish discovery and selection separately. Link creation alone is not proof of either.

### Fallback: generated runtime copy

If the runtime or operating system does not support the link reliably:

1. copy the canonical skill directory to `.agents/skills/evidence-based-change-review`;
2. treat the copy as generated output;
3. record the source commit used;
4. never edit the generated copy directly;
5. replace it from canonical source for every update.

Do not create a separately maintained Codex-specific SKILL.md unless testing demonstrates a necessary incompatibility.

This generated-copy fallback was not needed or exercised in the 2026-10-05 Windows junction run.

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
