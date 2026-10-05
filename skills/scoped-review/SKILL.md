---
name: scoped-review
description: Review a set of code changes and report findings ranked by severity.
disable-model-invocation: true
---

# Scoped Review

Requested: $ARGUMENTS

## 1. Dispatch the reviewer

Dispatch the `scoped-reviewer` agent in the foreground. Its task message is exactly this section, and nothing else:

```markdown
## Changes

<the requested changes>
```

## 2. Print the report

Print the returned report unchanged, with nothing before or after it.
