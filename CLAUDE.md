# Global instructions

## Git branches, commits, and pull requests

When creating a branch, writing a commit message, or opening a pull request,
look for the repo's pull request template — `pull_request_template.md`
(any casing) in the repo root, `docs/`, or `.github/`. Follow the
branch/commit/title conventions it documents, and use it as the PR body when
opening a PR.

If no template is found, use these defaults:

- Branch: `<snake_case_description>`
- Commit / PR title: Conventional Commits — `<type>: <summary>`

Only create branches, commits, or PRs when explicitly asked. If you are
missing anything they require, ask before proceeding — do not guess.

Never silently drop a required section or field you can't fill. Keep it
and leave a `TODO: <what is needed>` placeholder, then call it out when you
report your work.

Before pushing, read the CI workflow files to find the exact scripts the
checks invoke, and run the ones covering your changed files locally.

## Conditional class names

If the project already uses a class-name utility (e.g. `classnames`/`cx`,
`clsx`), prefer it over template literals and ternaries for conditional
or composed class names, matching how the project imports and uses it.

## Comments

Do not write comments. Prefer clear names and code that explains itself.

The only exception: annotate an opaque literal or expression whose meaning
isn't obvious on its own — e.g. `24 * 60 * 60 * 1000 // 1 day`. State just
what the value means, nothing more.
