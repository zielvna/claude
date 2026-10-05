# Claude 🦀

## Overview 📝

This is my personal Claude Code configuration. It holds my global CLAUDE.md rules, skills and agents, plus the plugins, MCP servers and settings I use day to day. Everything lives here under version control and gets symlinked or installed by one script, so edits are live immediately and a new machine is one clone away.

## Stuff 📦

### Rules

- `CLAUDE.md` - global instructions

### Skills

- `nest-practices` - NestJS conventions
- `react-practices` - React conventions
- `ts-practices` - TypeScript and JavaScript conventions
- `ship` - git and pull request conventions
- `scoped-review` - code review
- `scoped-recheck` - re-check of the last code review

### Agents

- `scoped-reviewer` - reviewer used by the review skills

### Plugins

- `superpowers` - development workflow skills
- `context7` - up-to-date library documentation
- `frontend-design` - guidance for UI design
- `typescript-native-lsp` - TypeScript language server

### MCP servers

- `chrome-devtools` - drive and inspect Chrome
- `next-devtools` - Next.js development tools

### skills.sh

- `vercel-react-best-practices` - React best practices

### Settings

- `settings.json` - Claude Code preferences

## Installation 💾

Clone repository:

```bash
git clone https://github.com/zielvna/claude.git
```

Run the install script:

```bash
./install.sh
```

It links the skills, agents and CLAUDE.md into `~/.claude`, installs the plugins, MCP servers and skills.sh skills listed in `install.sh`, then merges `settings.json` into your settings. It needs `jq` and Node.js. Re-running it is safe.

Then start Claude Code and run `/context` to confirm everything loaded.

## Cleanup 🧹

Quit Claude Code and run the cleanup script:

```bash
./cleanup.sh
```

It deletes Claude Code sessions, project data, caches, logs and backups, and keeps your rules, settings, skills, agents, commands, plugins and MCP servers.
