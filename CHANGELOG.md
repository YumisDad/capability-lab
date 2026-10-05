# Changelog

All notable capability-lab changes should be recorded here.

This repository is experimental. A changelog entry records source changes; it does **not** prove the capability was installed or behaved correctly in any runtime.

## Unreleased

### Added
- Codex CLI 0.160.0 portability evidence dated 2026-10-05, including all shared cases, missing-resource control, bounded update/revert, and no-skill baseline. Records include ambiguous selection defects, incomplete B10 behavior, and unsuccessful setup/harness attempts; this is not a promotion or cross-platform success claim.
- Initial cross-platform `evidence-based-change-review` Agent Skill experiment.
- Shared activation, non-activation, behavior, adversarial, failure, update, and rollback evaluation cases.
- Thin Claude Code and Codex adapter guidance.

### Corrected
- Codex adapter discovery guidance to the observed `.agents/skills` path, with the tested Windows junction mechanism. Legacy `.codex/skills` compatibility and fresh desktop-chat behavior remain untested.

### Experimental lifecycle
- `86297500e945aded238224ccad2b460e9010363d`: added explicit installation/effectiveness labels for a bounded runtime test.
- `440f3fc8e49133ba588765bdf9f7caa658a77e33`: restored the pre-update skill; fresh activation, non-activation, and affected-behavior checks were run. Both commits are retained.

### Boundaries
- No credentials or private case data.
- No MCP server or live integration.
- No subagent implementation.
- No production deployment.
