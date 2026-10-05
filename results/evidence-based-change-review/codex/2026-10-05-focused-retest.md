# Focused Codex correction retest — 2026-10-05

## Finding

**PASS** under the requested, unchanged decision rule. Both positive controls loaded; both negative controls did not; all three M1 and all three M2 runs avoided full skill loading; both explicit B10 runs materially satisfied all six recovery/preservation properties.

This is a focused result for this candidate and these 12 runs. It does not replace the [original portability record](2026-10-05.md), establish statistical routing reliability, or establish the other platform’s behavior. A terminology caveat in both B10 outputs is retained below.

## Environment

- Runtime: **codex-cli 0.160.0**, fresh sequential non-interactive Codex CLI sessions on Windows.
- Configured model: **gpt-6-astra**; reasoning effort: **xhigh**. Read from CLI configuration; the served model is not independently identified in execution events. No override was supplied.
- Branch: `experiment/evidence-based-change-review`.
- Tested HEAD: [`ba8fb44b33b1497a7792d57d35124cdc2123517d`](https://github.com/YumisDad/capability-lab/commit/ba8fb44b33b1497a7792d57d35124cdc2123517d); it is exactly the requested correction, not merely a descendant.
- Working tree was clean before testing. The existing checkout was fast-forwarded from the previous evidence commit; no canonical skill edit was made during this retest.
- Canonical skill: `skills/evidence-based-change-review/SKILL.md`.
- Exposure: the existing Windows junction at `.agents/skills/evidence-based-change-review`. Real-path resolution equals the canonical directory; no second installed or editable copy was made.
- Canonical and exposed SHA-256: `843888b4f0e4e7734ce62ad7a7aa0d8807b73bdba0fca7557e9657136e318af0`. Equal before testing and in every run’s metadata.
- Reference and evaluation file hashes are recorded in [environment.json](2026-10-05-focused-retest-evidence/environment.json) and checked again after the runs.

## Method and unchanged decision rule

Exactly 12 sessions were run: A1, A3, N1, N5 once each; M1 and M2 three times each; B10 twice. Each launched a new `codex exec --ephemeral --json` process and produced a distinct thread ID. No runtime case was retried, discarded, or replaced, and no unrelated case, missing-resource test, update-propagation test, or no-skill baseline was run.

Automatic-routing runs use the exact activation-file prompt with no skill name or invocation. B10 uses the exact supplied scenario after the explicit envelope shown in each record. Successful reads of the target `SKILL.md`, including its corrected body, are strong loading evidence. The negative observations are complete fresh-session traces without a target read or invocation declaration, alongside proportionate responses; writing style alone is not used as loading evidence.

The runner retains the original experiment’s common safety boundary, read-only tools, and disabled approval requests. It prohibits external actions, private data, credentials, subagents, and reading evaluation definitions/results to find answers. These constraints are common across runs; the read-only boundary affects M2’s deployment wording but does not instruct it to load or avoid this skill. The reviewed scenarios remain data. No criterion-specific desired answer was supplied to B10 beyond explicitly choosing the skill.

PASS requires both positives to load, both negatives to avoid loading, every M1/M2 repetition to avoid full loading, and both B10 responses to meet all six properties. Three repetitions are reported descriptively, not as a reliability probability. Process exit success is not a behavioral pass criterion.

## Results

| Group | Observed result | Assessment |
|---|---|---|
| A1, A3 | Both successfully read the corrected skill and preserved required review behavior | PASS |
| N1, N5 | Neither loaded; ordinary code/help responses | PASS |
| M1 | 0 of 3 loaded; all asked for code/diff without the full method | PASS |
| M2 | 0 of 3 loaded; all asked for deployment context without a full decision review | PASS |
| B10 | 2 of 2 loaded; both satisfied all six required properties | PASS |

Exact prompts, full responses, stdout events, stderr, source/hash metadata, and thread IDs are preserved in [runs.jsonl](2026-10-05-focused-retest-evidence/runs.jsonl). The manual property assessment is in [assessments.json](2026-10-05-focused-retest-evidence/assessments.json).

### A1 — run 1

- Fresh thread: `01a10da5-00b9-7331-abb7-03d6e3f32023`.
- Result: **PASS**. Skill loading: **observed**.
- Evidence: completed command event(s) `item_1` successfully read the target core, with exit code 0 and the corrected instruction body in the output.
- Material behavior: Asked for the missing proposal, baseline, evidence, and recovery context; retained smaller-alternative, verification, and downstream-recovery orientation without inventing material.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Review this proposed n8n change before I implement it. I want to know whether the evidence supports it and how I would recover if it goes wrong.
```

### A3 — run 1

- Fresh thread: `01a10da5-7f3c-7ec2-85e5-d04328534b8b`.
- Result: **PASS**. Skill loading: **observed**.
- Evidence: completed command event(s) `item_1` successfully read the target core, with exit code 0 and the corrected instruction body in the output.
- Material behavior: Challenged whether handoffs were avoidable work or necessary judgment/checks; considered removing a handoff, shared queues, and deterministic automation; counted review, exception handling, and recovery effort.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
We want to replace three manual handoffs with an agent. Challenge the design before we build it.
```

### N1 — run 1

- Fresh thread: `01a10da6-2956-73e0-8c4a-353fce8a5a5c`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Returned a normal Python csv.DictReader function and brief explanation, with no change-review method.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Write a Python function that parses a CSV file.
```

### N5 — run 1

- Fresh thread: `01a10da6-72f6-7ee1-8f00-b0e6a455e894`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked for the README sentence containing the typo, with no review ceremony.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Fix this typo in a README.
```

### M1 — run 1

- Fresh thread: `01a10da6-ce22-7712-9867-3c250cd734e2`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked for the diff or before/after code and intended behavior; offered ordinary bug, regression, and test-gap review.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Is this code change okay?
```

### M1 — run 2

- Fresh thread: `01a10da7-035f-7702-96f4-4c027f55d614`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked for the missing diff and intended behavior; offered ordinary bug, regression, and test-gap review.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Is this code change okay?
```

### M1 — run 3

- Fresh thread: `01a10da7-3821-7573-acf6-ef5935ead34b`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked for the diff or before/after code and intended behavior; offered ordinary bug/regression review.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Is this code change okay?
```

### M2 — run 1

- Fresh thread: `01a10da7-6e21-7d91-ba38-6086499dc55e`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. The only command was Get-Location.
- Material behavior: Asked what was being deployed and the target environment; requested files/configuration and explained the read-only limit. No full decision review.
- Unexpected behavior: Ran Get-Location once. This was a workspace-location probe, not a skill read; its output is retained with the machine path redacted.

Exact submitted prompt:

```text
Help me deploy this.
```

### M2 — run 2

- Fresh thread: `01a10da7-c5a0-7512-862e-97f91adaa765`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked for the project, hosting platform, configuration, and any error; explained the read-only limit. No full decision review.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Help me deploy this.
```

### M2 — run 3

- Fresh thread: `01a10da8-10b2-7370-8eb1-57019c87fd6f`.
- Result: **PASS**. Skill loading: **not observed**.
- Evidence: the complete trace contains no target skill read or invocation declaration. No commands were executed.
- Material behavior: Asked what was being deployed and where, requesting files/setup instructions and target server/platform. No full decision review.
- Unexpected behavior: None in the tested behavior.

Exact submitted prompt:

```text
Help me deploy this.
```

### B10 — run 1

- Fresh thread: `01a10da8-6868-7261-92f4-4ba432a294e7`.
- Result: **PASS**. Skill loading: **observed**.
- Evidence: completed command event(s) `item_1` successfully read the target core, with exit code 0 and the corrected instruction body in the output.
- Material behavior: Preserve evidence, restore the known-good version before tuning when safe/practical, verify positive and negative routing, then test a bounded correction; keep failed evidence after recovery.
- Unexpected behavior: Terminology caveat: the explicit-only containment fallback says it loses automatic discovery. Under the experiment's definitions this should distinguish automatic selection from metadata discovery. All six required properties are nevertheless materially present.

Exact submitted prompt:

```text
Use $evidence-based-change-review to review the following synthetic scenario. This is review only.

After a skill update, automatic invocation becomes noisy and starts triggering on ordinary coding requests.
```

### B10 — run 2

- Fresh thread: `01a10da9-205e-7db3-b335-204937809389`.
- Result: **PASS**. Skill loading: **observed**.
- Evidence: completed command event(s) `item_1` successfully read the target core, with exit code 0 and the corrected instruction body in the output.
- Material behavior: Identified operator friction, retained failed version/diff/outcomes after recovery, recommended safe/practical restore first and behavioral verification, then diagnosis and bounded correction with positive/negative routing checks.
- Unexpected behavior: Terminology caveat: the explicit-only fallback describes reduced automatic discovery rather than distinguishing it from automatic selection. This imprecision is retained; it does not omit any of the six required recovery/preservation properties.

Exact submitted prompt:

```text
Use $evidence-based-change-review to review the following synthetic scenario. This is review only.

After a skill update, automatic invocation becomes noisy and starts triggering on ordinary coding requests.
```

## B10 property-by-property assessment

Both B10 runs explicitly selected the skill; these are behavior tests, not evidence of automatic B10 routing. The scenario was synthetic: no actual rollback or deployment was performed or claimed in this retest.

| Required property | Run 1 evidence | Run 2 evidence |
|---|---|---|
| 1. Recognize noisy invocation as an operator-cost regression. | Unnecessary reviews add friction and divert work from the requested task. | The material risk is added friction and diverted effort. |
| 2. Preserve failed version, diff, and results as evidence. | Retain the failed version, its diff against the prior version, and representative prompts and outputs showing unwanted invocation. | retain the failed version, its diff, and representative failing prompts with their surrounding context and actual invocation outcomes. |
| 3. Restore the last known-good version before tuning when practical and safe. | Recommend preserving the failure evidence and restoring the last known-good version before attempting further tuning, where practical and safe. | Restore the last known-good version first |
| 4. Verify that prior behavior is actually restored. | Verify its behavior rather than assuming rollback worked. | Verify its behavior before attempting further changes. |
| 5. Only then diagnose and test a bounded correction. | Then test a bounded correction. | Diagnose after recovery |
| 6. Retain the failed experiment after recovery; do not erase or rewrite it because rollback succeeds. | Keep the failed evidence afterward. | Keep these records after recovery. |

Run 1 leads with restoration before further tuning when practical and safe, then supplies behavioral replay checks before bounded correction. Run 2 explicitly says to verify the restored version before further changes and diagnose after recovery. Both instruct keeping the failed evidence after recovery, materially satisfying preservation without requiring the exact phrase “do not rewrite history.”

**Preserved caveat:** both fallback paragraphs refer to reduced/lost “automatic discovery” under explicit-only containment. The experiment distinguishes metadata discovery from selection/invocation; that terminology should be kept separate. The traces do not establish loss of metadata discovery. This imprecision is recorded, not removed, and does not omit any of the six predeclared recovery/preservation properties. It is not treated as evidence of a newly introduced routing regression.

## Scope, unsuccessful setup, and integrity

The first branch fetch stalled and was canceled before testing; one timeout-bounded fetch succeeded. This was a setup retry, not a discarded runtime failure. CLI stderr warnings concerning plugin icons and PowerShell shell snapshots are retained in the traces. M2 run 1 performed a harmless current-directory probe. No unexpected skill invocation, unauthorized implementation, or failed test process was observed.

The report and traces redact local machine paths as `<REPO>` and `<USER_HOME>`; the raw event-file SHA-256 values remain available for local audit. No credential values, full account configuration files, or private case data are published. Exact prompts and outputs are otherwise preserved.

[integrity.json](2026-10-05-focused-retest-evidence/integrity.json) records checks of prompt equality, 12 unique threads, unchanged source/evaluation hashes, loading evidence, and the six B10 properties. [file-manifest.json](2026-10-05-focused-retest-evidence/file-manifest.json) lists every file in this evidence publication.

The captured runner files are evidence of how the test was executed. They expect a scratch directory beside a checkout named `capability-lab`, fixed at the tested commit, with an already configured Codex CLI and existing junction. They run sequentially, refuse to overwrite completed records, and preserve each run separately. The model uses the recorded existing configuration. No credentials, infrastructure, or packages are installed.

## Repository hygiene and PR

Only this new result record and its focused evidence directory are included in the publication. The canonical skill, reference, evaluation definitions, original experiment results, README, adapter, and CHANGELOG are unchanged by the retest. No history is rewritten. PR #2 remains draft and unmerged; `main` is untouched. The evidence commit SHA is reported in the final response, avoiding a self-referential commit hash inside this record.

## Recommendation

**Freeze the canonical candidate at `ba8fb44` for the independent Claude Code portability test.** The focused Codex correction passes; do not continue Codex tuning on this sample. Preserve the original failures, this passing retest, and the terminology caveat. Broader portability and value over ordinary project context remain separate questions, as recorded in the original experiment.
