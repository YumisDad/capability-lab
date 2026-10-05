# Activation Cases

These cases test whether the runtime discovers and selects the skill appropriately.

Do **not** explicitly name the skill during automatic-discovery tests.

## Should activate

| ID | Prompt | Expected |
|---|---|---|
| A1 | Review this proposed n8n change before I implement it. I want to know whether the evidence supports it and how I would recover if it goes wrong. | Activate. Review objective, evidence, failure modes, verification, rollback, and smaller alternatives. |
| A2 | Check whether this database migration plan has adequate evidence, sequencing, and rollback. | Activate. |
| A3 | We want to replace three manual handoffs with an agent. Challenge the design before we build it. | Activate. Include human-burden and subtraction analysis. |
| A4 | Audit this proposed API integration for operational risk and whether a simpler option would work. | Activate. |
| A5 | Before deployment, review this configuration change and tell me what would falsify the recommendation. | Activate. |

## Should not activate

| ID | Prompt | Expected |
|---|---|---|
| N1 | Write a Python function that parses a CSV file. | Do not activate unless the user separately requests a change review. |
| N2 | Rewrite this email to sound more concise and professional. | Do not activate. |
| N3 | Summarize this article in five bullets. | Do not activate. |
| N4 | What does HTTP 429 mean? | Do not activate. |
| N5 | Fix this typo in a README. | Do not activate for a trivial reversible edit. |

## Ambiguous cases

| ID | Prompt | Expected |
|---|---|---|
| M1 | Is this code change okay? | Activate only if context shows a meaningful proposed system/code change requiring review; otherwise perform a light code review without forcing the full method. |
| M2 | Help me deploy this. | Do not automatically turn implementation into a full review. If consequence is material and the user has not asked for review, surface only essential pre-deployment concerns. |
| M3 | We changed the workflow yesterday and it seems fine. | Use the skill if the user is asking whether the change is effective/safe; otherwise answer the actual question. |

## Pass condition

The runtime should select the skill because of task intent, not because a keyword such as "system" or "workflow" appears.

A false positive that creates unnecessary ceremony is a defect. A missed invocation on a consequential explicit review request is also a defect.
