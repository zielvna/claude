---
name: render-markdown
description: Live preview of a markdown file in the browser. Use whenever the user asks to render, preview, view or read a markdown file, spec or plan.
argument-hint: "[file.md]"
allowed-tools: Bash(node ~/.claude/skills/render-markdown/scripts/serve.ts:*)
---

# Render Markdown

Requested: $ARGUMENTS

## 1. Find the file

Use the markdown file in the request. If the request names no file, use the
spec or plan you last wrote or read in this conversation. If there is none,
ask for the file.

## 2. Start the server

If a server you started in this conversation for this file is still running,
use its URL. Go to step 3.

Otherwise, run this in the background and read the URL it prints:

```bash
node ~/.claude/skills/render-markdown/scripts/serve.ts <file.md>
```

If it fails, show its error and stop.

## 3. Report

Print the URL.
