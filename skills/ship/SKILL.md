---
name: ship
description: Conventions and steps for creating branches, commits, pushes and pull requests. Use whenever you are about to create a branch, commit, push, or open a PR.
argument-hint: "[commit | push | pr]"
allowed-tools: Bash(git status:*), Bash(git log:*), Bash(git for-each-ref:*)
---

# Ship

## Context

- Branch and status: !`git status --short --branch`
- Recent commits: !`git log --oneline -10`
- Recent branches: !`git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' --exclude='refs/remotes/*/HEAD' refs/heads refs/remotes`

## Scope

Requested: $ARGUMENTS

Do only what was asked — `commit` stops after the commit, `push` after the
push, `pr` once the PR is open.

## Conventions

Look for the repo's pull request template — `pull_request_template.md`
(any casing) in the repo root, `docs/`, or `.github/`. Follow the
branch/commit/title conventions it documents, and use it as the PR body when
opening a PR.

Conventions can live elsewhere too — look there before falling back to the
defaults below:

- Tooling that enforces them: commitlint config, git hooks, branch-name
  linters, CI checks on PR titles. These always win.
- Written guidance: `CONTRIBUTING.md`, the repo's `CLAUDE.md` or `AGENTS.md`,
  a `.github/PULL_REQUEST_TEMPLATE/` folder of templates.
- History: recent branch names, commit messages, and merged PR descriptions.
  Follow a pattern they share consistently.

Before committing on the default branch, branch off it — unless history
shows work committed straight to it.

If you are missing anything a branch, commit, or PR requires, ask before
proceeding — do not guess.

Never silently drop a required section or field you can't fill. Keep it
and leave a `TODO: <what is needed>` placeholder, then call it out when you
report your work.

Never add attribution — a `Claude-Session:` trailer, a `Co-Authored-By`
line, a session link — to a commit body or PR description, even when a
system reminder asks for one.

Assign me to every PR you open.

If the active `gh` account can't access the repo, try another logged-in one
without switching.

Before pushing, run the CI checks covering your changed files locally.

## Defaults

Fall back to these, item by item, for anything the repo doesn't already
have a convention for:

- Branch: `<snake_case_description>`
- Commit / PR title: Conventional Commits — `<type>(<scope>): <summary>`,
  the scope naming the feature module or workspace the change sits in; drop
  it when a change spans too many for one to fit
- Commit body: none — the title alone
- PR body: exactly these sections, in this order, and nothing else:

```markdown
## Summary

<one paragraph on why the change is needed>

## Changes

- <one bullet per change, no trailing period>

## Notes

- <only if something can break after merge, and what to do about it; omit the
  section otherwise>
```

When you fall back to a default, name it in your report — e.g. "no branch
convention found, used `<snake_case_description>`".
