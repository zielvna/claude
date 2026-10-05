#!/usr/bin/env bash
set -euo pipefail

CLAUDE="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CLAUDE_JSON="${CLAUDE_CONFIG_DIR:+$CLAUDE_CONFIG_DIR/.claude.json}"
CLAUDE_JSON="${CLAUDE_JSON:-$HOME/.claude.json}"

PATHS=(
  "$CLAUDE/projects"
  "$CLAUDE/file-history"
  "$CLAUDE/sessions"
  "$CLAUDE/session-env"
  "$CLAUDE/shell-snapshots"
  "$CLAUDE/history.jsonl"
  "$CLAUDE/plans"
  "$CLAUDE/jobs"
  "$CLAUDE/daemon"
  "$CLAUDE/daemon.log"
  "$CLAUDE/ide"
  "$CLAUDE/state"
  "$CLAUDE/feedback"
  "$CLAUDE/telemetry"
  "$CLAUDE/.last-cleanup"
  "$CLAUDE/.last-update-result.json"
  "$CLAUDE/backups"
  "$CLAUDE_JSON.backup"
  "$CLAUDE/cache"
  "$CLAUDE/paste-cache"
  "$CLAUDE/plugins/plugin-catalog-cache.json"
  "$CLAUDE/plugins/plugin-directory-cache-v2.json"
  "$CLAUDE/plugins/cache"
  "$CLAUDE/plugins/data"
  "$CLAUDE/plugins/store"
  "$CLAUDE/plugins/synced"
  "$CLAUDE/skills/synced"
  "$HOME/.cache/claude"
  "$HOME/Library/Caches/claude-cli-nodejs"
)

echo "This deletes Claude Code sessions, project data, caches, logs and backups."
echo "Quit Claude Code before continuing."
read -r -p "Continue? [y/N] " answer
[ "$answer" = "y" ] || exit 1

for path in "${PATHS[@]}"; do
  rm -rf "$path"
done

if [ -f "$CLAUDE_JSON" ]; then
  jq 'del(.projects)' "$CLAUDE_JSON" > "$CLAUDE_JSON.tmp"
  mv "$CLAUDE_JSON.tmp" "$CLAUDE_JSON"
fi
