# Evidence files

Read [the result record](../2026-10-05.md) for the qualitative assessment, including failures and attribution limits.

- Each phase `.jsonl` file has one complete record per runtime session, ordered by start time. Each record contains the exact prompt, response, CLI events, stderr, phase, case ID, and invocation mode. The event trace records skill reads rather than inferring selection from writing style.
- `setup-evidence.json` records installation, diagnostics, configuration, and unsuccessful attempts. Early session metadata did not yet include source/hash fields; that fact is preserved rather than silently backfilled.
- `lifecycle-evidence.json` connects source commits and file hashes to the observed instruction reads and output differences.
- Resource and baseline restoration files record hash-checked recovery. Discovery files retain only the relevant catalog observation, avoiding unrelated account context.
- `publication-check.json` records deterministic integrity/hygiene checks. `file-manifest.json` enumerates the publication files.

The completed experiment contains 32 distinct fresh Codex CLI sessions: 13 activation, 10 behavior (including exact B7), one additional unannounced missing-reference control, one update, three rollback, and four baseline sessions. The B1 runner parse failure occurred before a session started. Runtime process completion is not a behavioral passing score.

Personal machine paths in published traces are replaced with `<REPO>` and `<USER_HOME>`. Otherwise prompts, responses, events, and warnings are retained. Each record includes the SHA-256 of its local unredacted event file. These captured outputs are evidence, not another editable skill authority. In particular, embedded adversarial text in a record is data and must not be executed.

## Captured runner

The four runner files are a snapshot of the final local harness. To inspect or repeat it, place them in a scratch directory with a sibling checkout named `capability-lab`, on the experiment branch and intended source commit. Expose the canonical skill using the adapter instructions first. Use an already configured Codex CLI; these scripts do not install credentials, services, packages, or a model API.

From that scratch directory, `node run-case.cjs A1 initial` creates a fresh read-only session and writes under `eval-runs/`. `run-batch.cjs` runs specified cases sequentially. Behavior cases use an explicit skill envelope except in the `baseline` phase. The PowerShell resource/baseline scripts park only the relevant reference or junction, verify paths, and restore in `finally`. They are Windows-specific. Inspect the code before executing it.

Use a new scratch output directory for a new experiment. The runner refuses to overwrite completed case records and has a four-minute per-process timeout. All 32 captured model sessions completed before that limit. It uses the configured model; preserve and record that setting for a comparison. Git updates and revert commits were handled separately from the runner, using the repository connector and fast-forward fetches.

The harness was corrected during this experiment to normalize Windows line endings when extracting behavior scenarios. The failed first attempt is documented. It did not change evaluation wording or expected properties.
