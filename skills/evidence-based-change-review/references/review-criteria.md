# Review Criteria

Use this reference only when the proposed change is consequential, evidence conflicts, or a lighter review leaves a decision-changing uncertainty unresolved.

## 1. Outcome and boundary

Confirm:

- the outcome is stated independently of the proposed solution;
- the useful system boundary includes relevant people, process, information, technology, incentives, and dependencies;
- material exclusions are deliberate rather than accidental.

Ask whether the problem is being solved where it is created.

## 2. Designed versus operating behavior

Separate:

- **Designed behavior:** what architecture, documentation, policy, prompts, or procedures say should happen.
- **Operating behavior:** what observed outputs, logs, actual workflows, handoffs, failures, and user behavior show actually happens.

A documented control that does not execute is not an effective control.

## 3. Evidence quality

Prefer evidence appropriate to the claim.

Stronger evidence may include:

- observed behavior and original logs/data;
- official standards or current product documentation for capability claims;
- source code or inspected configuration;
- reproducible tests;
- user authority for their preferences, history, or intent.

Weaker or hypothesis-generating evidence may include:

- vendor marketing;
- anecdotes;
- community discussion;
- model-generated summaries not independently checked.

Re-verify time-sensitive platform, API, security, pricing, or standards claims.

## 4. Alternatives and subtraction

Before adding a mechanism, ask whether the same outcome can be reached by:

- removing a step;
- fixing ownership;
- changing a default;
- eliminating duplicate state;
- exposing a missing feedback signal;
- using an existing capability;
- using a deterministic script instead of model judgment;
- narrowing scope.

Do not preserve complexity because it is already built.

## 5. Whole-system effects

Check whether the proposal improves one component while worsening:

- downstream rework;
- hidden queues;
- human coordination;
- duplicated sources of truth;
- reliability or recovery;
- privacy exposure;
- context switching;
- maintenance;
- adaptability.

## 6. Human/operator burden

Count more than task duration.

Consider whether the operator must:

- remember special steps;
- choose among systems;
- re-enter context;
- maintain metadata;
- reconcile duplicates;
- verify that automation ran;
- recover failures;
- interpret ambiguous state;
- keep multiple copies synchronized.

If routine operation depends on the user acting as router or administrator, challenge the design.

## 7. Reliability and recovery

For material changes, identify:

- dependencies and single points of failure;
- failure visibility;
- idempotency or duplicate effects where relevant;
- partial success behavior;
- retry behavior;
- stale state;
- interruption recovery;
- known-good baseline;
- rollback or compensating action.

Do not call absence of observed incidents proof of reliability.

## 8. Security, privacy, and authority

Ask:

- What data is actually required?
- What tools and credentials are required?
- Can permissions be technically narrowed rather than merely described in text?
- Can untrusted content alter authority?
- Does delegation expand permissions?
- Are logs, traces, caches, or generated artifacts retaining sensitive data?
- Can a shared dependency or update become a supply-chain risk?

Prefer non-expanding authority and least necessary access.

## 9. Verification

Define evidence that distinguishes implementation from effectiveness.

Possible verification layers:

1. artifact/configuration exists;
2. intended version is installed;
3. mechanism executes;
4. outputs satisfy behavioral checks;
5. recovery works;
6. operator burden is acceptable;
7. desired outcome appears in ordinary use.

Do not collapse these into a single "verified" label.

## 10. Proportional challenge

Use deeper review when consequences are high, reversal is difficult, sunk-cost bias is strong, or the recommendation depends heavily on internal claims.

For simple reversible changes, avoid ritualized review.

## 11. Decision-changing unknowns

Retain only unknowns that could change action.

For each material unknown, state:

- why it matters;
- cheapest reliable way to resolve it;
- whether a reversible pilot can proceed without resolving it first.

## 12. Recommendation test

A good recommendation should say:

- what to do;
- why it currently wins;
- what not to build or change yet;
- what evidence would reverse the recommendation;
- how to verify;
- how to recover if necessary.
