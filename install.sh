#!/usr/bin/env bash
set -euo pipefail
 
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE="$HOME/.claude"
 
mkdir -p "$CLAUDE/skills" "$CLAUDE/commands" "$CLAUDE/agents"
 
if [ -f "$REPO/CLAUDE.md" ]; then
  ln -sfn "$REPO/CLAUDE.md" "$CLAUDE/CLAUDE.md"
fi
 
for skill in "$REPO"/skills/*/; do
  [ -d "$skill" ] || continue
  target="$CLAUDE/skills/$(basename "$skill")"
  [ -L "$target" ] || rm -rf "$target"
  ln -sfn "${skill%/}" "$target"
done
 
for file in "$REPO"/commands/*.md; do
  [ -f "$file" ] || continue
  ln -sfn "$file" "$CLAUDE/commands/$(basename "$file")"
done
 
for file in "$REPO"/agents/*.md; do
  [ -f "$file" ] || continue
  ln -sfn "$file" "$CLAUDE/agents/$(basename "$file")"
done