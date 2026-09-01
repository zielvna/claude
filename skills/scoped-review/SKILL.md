---
name: scoped-review
description: Reviews a specified set of code changes and reports findings ranked by severity, or re-checks a previous report against the current code. Use for any request to review or re-check code, always through this skill rather than directly, passing the previous report verbatim in the invocation when re-checking.
context: fork
background: false
---

# Scoped Review

Review a set of code changes and report findings ranked by severity.

## 1. Resolve the scope

Resolve the caller's requested changes to a concrete diff.

## 2. Gather context

Investigate the changes' purpose from whatever sources exist (e.g. PR description
and its links, branch name, commit messages).

## 3. What to look for

- Intent — missing or mismatched requirements.
- Correctness — bugs, edge cases, broken logic.
- Security — injection, auth gaps, unsafe input, leaked secrets.
- Duplication — reinventing existing helpers, copy-pasted logic.
- Simplification — needless complexity, dead code.
- Efficiency — avoidable work, N+1 queries.
- Readability — unclear names, confusing control flow.
- Test coverage — missing or weak tests for the change.
- Conventions — deviations from established project patterns.

## 4. Filter the noise

Ignore nitpicks, anything tooling already catches, and pre-existing issues outside the change.

## 5. Report

Output only the findings list, one block per finding, ordered from critical to low, with a blank line between blocks:

```
**#<NUMBER>** - **<SEVERITY>** - **<CATEGORY>** - <LOCATION> - <STATUS>
**FINDING:** <FINDING>
**FIX:** <FIX>
```

- `<NUMBER>` — the finding's index. Sequential, starting at 1.
- `<SEVERITY>` — critical, high, medium, or low. Uppercased.
- `<CATEGORY>` — the matching category from section 3. Uppercased.
- `<LOCATION>` — a single `file:line` pointing at the most relevant line. One line number, no ranges or comma lists. Use `NONE` if the finding has no single location.
- `<STATUS>` — ❌ unresolved, ✅ resolved, or ⏭️ skipped (the caller chose to dismiss it). Always ❌ on a first review.
- `<FINDING>` — the issue and its concrete consequence. As long as needed to be clear.
- `<FIX>` — the change to make.

If there are no findings, output exactly one line — `No findings`.

## 6. Re-check

A previous report may be included in the invocation. When it is, it is the baseline: re-output the full list with the same findings, numbers, and order, reproducing each finding's text exactly and rewriting only what the code changed. Update each existing `<STATUS>`: ✅ if the code now addresses it, ⏭️ if the caller dismissed it, otherwise ❌. Append any newly introduced findings after the existing ones, continuing the numbering.
