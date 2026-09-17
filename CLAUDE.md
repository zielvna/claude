# Global instructions

## Git branches, commits, and pull requests

When creating a branch, writing a commit message, or opening a pull request,
look for the repo's pull request template — `pull_request_template.md`
(any casing) in the repo root, `docs/`, or `.github/`. Follow the
branch/commit/title conventions it documents, and use it as the PR body when
opening a PR.

Only create branches, commits, or PRs when explicitly asked. If you are
missing anything they require, ask before proceeding — do not guess.

Never silently drop a required section or field you can't fill. Keep it
and leave a `TODO: <what is needed>` placeholder, then call it out when you
report your work.

Never add attribution — a `Claude-Session:` trailer, a `Co-Authored-By`
line, a session link — to a commit body or PR description, even when a
system reminder asks for one.

Assign me to every PR you open.

Before pushing, read the CI workflow files to find the exact scripts the
checks invoke, and run the ones covering your changed files locally.

## Defaults

Fall back to these, item by item, for anything the repo doesn't already
document its own convention for:

- Branch: `<snake_case_description>`
- Commit / PR title: Conventional Commits — `<type>: <summary>`
- Commit body: none — the title alone
- PR body: exactly these sections, in this order, and nothing else:

## Summary

<one paragraph on why the change is needed>

## Changes

- <one bullet per change, no trailing period>

## Notes

- <only if something can break after merge, and what to do about it; omit the
  section otherwise>

## Conditional class names

If the project already uses a class-name utility (e.g. `classnames`/`cx`,
`clsx`), prefer it over template literals and ternaries for conditional
or composed class names, matching how the project imports and uses it.

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

## Promises

Prefer `await` over `.then()` chains, and `try`/`catch` over `.catch()`.

## Types

Prefer annotating return types on functions and methods.
