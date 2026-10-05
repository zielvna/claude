---
name: scoped-recheck
description: Re-check the last scoped-review report against the current code.
disable-model-invocation: true
---

# Scoped Recheck

Requested: $ARGUMENTS

## 1. Find the previous report

Find the report the `scoped-reviewer` agent most recently returned in this conversation. If it is no longer here in full, tell the user and stop.

## 2. Dispatch the reviewer

Dispatch the `scoped-reviewer` agent in the foreground. Its task message is exactly these sections, in this order, and nothing else:

```markdown
## Changes

<the changes the previous review covered>

## Previous report

<that report, copied verbatim>

## Dismissed

<only if the user dismissed findings since that report, in the request above or earlier in the conversation, their numbers; omit the section otherwise>
```

## 3. Print the report

Print the returned report unchanged, with nothing before or after it.
