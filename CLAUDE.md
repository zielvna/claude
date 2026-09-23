# Global instructions

## Git branches, commits, and pull requests

Only create branches, commits, pushes, or PRs when explicitly asked. When
you do, use the `ship` skill and follow it.

## Practices

When writing or changing code, use each matching `*-practices` skill and
follow it.

Their practices are defaults, not rules. Where the project already has an
established pattern — one that recurs, not a single occurrence — use it.
Apply a practice only when the project has no clear answer.

Look properly before concluding there is none — read the surrounding files
and search the wider codebase for how the same case is handled elsewhere.

## Code review

When asked to review code or re-check a previous review's report, use the
`scoped-review` skill.

## Comments

Do not write comments. Prefer clear names and code that explains itself.

The only exception: annotate an opaque literal or expression whose meaning
isn't obvious on its own — e.g. `24 * 60 * 60 * 1000 // 1 day`. State just
what the value means, nothing more.

## Naming

Prefer naming a value after the thing it holds, by its full name rather
than a fragment. A state or operation reads better qualifying that name
than replacing it, and is worth adding only to separate the value from
another in scope. Never name a value for its state alone — `filtered`
should be `filteredUsers`.
