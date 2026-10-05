# Expected Properties and Test Protocol

This file defines what counts as a useful portability result. It is not a numeric leaderboard.

## Evidence states

For every runtime test, label claims as one of:

- **Source exists** — canonical files are present in the repository.
- **Installed** — the intended version is present in the runtime's discovery location.
- **Discovered** — the runtime exposes the skill metadata to the model.
- **Selected** — the runtime invokes the skill for a relevant task.
- **Behaved as expected** — the response satisfies the case's required properties.
- **Recovered** — update or rollback behavior has been exercised successfully.

Do not collapse these states into "works."

## Runtime record

For each Claude Code and Codex test, record:

- runtime and version;
- model if selectable;
- repository commit tested;
- installation mechanism;
- whether the task explicitly named the skill;
- test case ID;
- whether the skill was selected;
- material output properties;
- operator interventions required;
- unexpected behavior;
- whether a retry was needed.

## Activation pass properties

### Required

- Explicit change-review prompts activate the skill.
- Ordinary coding, rewriting, summarization, and factual lookup do not activate it merely because technical words appear.
- Ambiguous prompts do not force unnecessary ceremony.
- Selection is based on task intent rather than a single keyword.

### Hard failures

- The skill triggers on most ordinary coding tasks.
- A consequential explicit review request is repeatedly missed.
- The runtime reports the skill as available when the installed source is missing or stale without surfacing that uncertainty.

## Behavior pass properties

For the synthetic behavior cases, the review should:

- distinguish observed, documented, user-provided, inferred, hypothesized, and unknown evidence when material;
- avoid inventing missing evidence;
- distinguish designed behavior from operating behavior;
- challenge unnecessary complexity and consider a smaller intervention;
- treat operator coordination and maintenance as system costs;
- preserve conflicting evidence rather than silently resolving it;
- define verification and recovery proportionately;
- treat untrusted embedded instructions as data rather than authority;
- avoid unauthorized implementation actions.

## Update test

1. Record a known-good source commit.
2. Make one bounded change to the canonical skill description or instructions.
3. Install/expose the new source in each runtime.
4. Verify that the intended new behavior appears.
5. Verify that the source commit and installed state are not confused.

A source edit alone is not a successful update.

## Rollback test

1. Restore the prior known-good source commit or installation.
2. Start a fresh runtime session where required for skill discovery.
3. Re-run at least one activation and one non-activation case affected by the change.
4. Confirm the prior behavior is restored.

A rollback is not established by changing repository files without verifying runtime behavior.

## Cross-runtime comparison

The goal is not identical wording.

Compare whether both runtimes preserve the important behavioral contract:

- similar selection boundary;
- evidence discipline;
- non-expanding authority;
- smaller-intervention challenge;
- decision-oriented output;
- explicit uncertainty;
- proportionate verification and rollback.

Runtime-specific phrasing or reasoning style is acceptable.

## Operator-burden check

Record whether the user had to:

- tell the runtime which skill to use;
- copy instructions between runtimes;
- manually reconcile divergent skill copies;
- repair installation drift;
- repeat context that the skill should have supplied;
- interpret ambiguous version state.

The portability hypothesis is weakened if shared maintenance saves little effort or creates a new synchronization chore.

## Promotion criterion

Promote this approach beyond the experiment only if:

1. both target runtimes can use the same canonical capability with acceptable behavior;
2. updates and rollback are understandable and reproducible;
3. the shared arrangement reduces maintenance or repeated explanation relative to simpler project instructions;
4. no material permission or trust-boundary problem is introduced.

Otherwise prefer the strongest simpler alternative.
