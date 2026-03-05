#!/usr/bin/env bash
# Installs skills from this repo into ~/.claude/skills/ so Claude Code can use them.
# Each skills/<name>/skill.md is symlinked as ~/.claude/skills/<name>/SKILL.md

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SKILLS_DIR="$REPO_ROOT/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"

installed=0
skipped=0

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  src="$skill_dir/skill.md"
  dest_dir="$CLAUDE_SKILLS_DIR/$skill_name"
  dest="$dest_dir/SKILL.md"

  if [ ! -f "$src" ]; then
    echo "  skip  $skill_name (no skill.md found)"
    ((skipped++)) || true
    continue
  fi

  mkdir -p "$dest_dir"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ok    $skill_name (already linked)"
    ((skipped++)) || true
    continue
  fi

  ln -sf "$src" "$dest"
  echo "  link  $skill_name → $dest"
  ((installed++)) || true
done

echo ""
echo "Done. $installed installed, $skipped already up to date."
echo "Restart Claude Code (or reload the window) to pick up new skills."
