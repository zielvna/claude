# Claude 🦀

## Overview 📝

This is my personal Claude Code configuration. It holds the skills, commands and agents I use day to day, plus my global CLAUDE.md rules. Everything lives here under version control and gets symlinked, so edits are live immediately and a new machine is one clone away.

## Installation 💾

Clone repository:

```bash
git clone https://github.com/zielvna/claude.git
```

Run the install script:

```bash
./install.sh
```

It links the skills, agents and CLAUDE.md into `~/.claude`, then installs the plugins and MCP servers listed in `install.sh`. The MCP servers run through `npx`, so they need Node.js. Re-running it is safe.

Then start Claude Code and run `/context` to confirm everything loaded.
