#!/usr/bin/env bash
set -euo pipefail
 
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

PLUGINS=(
  superpowers@anthropic-plugin-directory
  context7@anthropic-plugin-directory
  frontend-design@anthropic-plugin-directory
  typescript-native-lsp@anthropic-plugin-directory
)

MCPS=(
  "chrome-devtools npx chrome-devtools-mcp@latest"
  "next-devtools npx next-devtools-mcp@latest"
)

SKILLS=(
  "vercel-labs/agent-skills vercel-react-best-practices"
)

add_plugin() {
  claude plugin install "$1"
}

add_mcp() {
  local name="$1"
  shift
  claude mcp get "$name" >/dev/null 2>&1 || claude mcp add --scope user "$name" -- "$@"
}

add_skill() {
  npx -y skills add "$1" --skill "$2" --global --agent claude-code cursor --yes
}

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

for plugin in "${PLUGINS[@]}"; do
  add_plugin "$plugin"
done

for mcp in "${MCPS[@]}"; do
  add_mcp $mcp
done

for skill in "${SKILLS[@]}"; do
  add_skill $skill
done

if [ -f "$REPO/settings.json" ]; then
  jq -s '.[0] * .[1]' "$CLAUDE/settings.json" "$REPO/settings.json" > "$CLAUDE/settings.json.tmp"
  mv "$CLAUDE/settings.json.tmp" "$CLAUDE/settings.json"
fi