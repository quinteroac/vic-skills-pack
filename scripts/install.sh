#!/usr/bin/env bash
# Installs skills from this repo into Claude Code and/or GitHub Copilot CLI.
#
# Claude Code : skills/<name>/SKILL.md → ~/.claude/skills/<name>/SKILL.md
# Copilot CLI : skills/<name>/SKILL.md → ~/.copilot/agents/<name>.md
#
# Usage:
#   bash scripts/install.sh               # install for all detected tools
#   bash scripts/install.sh --claude      # Claude Code only
#   bash scripts/install.sh --copilot     # Copilot CLI only

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SKILLS_DIR="$REPO_ROOT/skills"

# ── parse flags ──────────────────────────────────────────────────────────────
do_claude=true
do_copilot=true

for arg in "$@"; do
  case "$arg" in
    --claude)  do_copilot=false ;;
    --copilot) do_claude=false  ;;
  esac
done

# ── helpers ───────────────────────────────────────────────────────────────────
link_skill() {
  local src="$1" dest="$2" label="$3"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  ok      [$label] $skill_name"
    return 1   # skipped
  fi
  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
  echo "  linked  [$label] $skill_name → $dest"
  return 0   # installed
}

# ── install ───────────────────────────────────────────────────────────────────
claude_installed=0; claude_skipped=0
copilot_installed=0; copilot_skipped=0

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  src="$skill_dir/SKILL.md"

  if [ ! -f "$src" ]; then
    echo "  skip    $skill_name (no SKILL.md found)"
    continue
  fi

  if $do_claude; then
    if link_skill "$src" "${HOME}/.claude/skills/${skill_name}/SKILL.md" "claude"; then
      ((claude_installed++)) || true
    else
      ((claude_skipped++)) || true
    fi
  fi

  if $do_copilot; then
    if link_skill "$src" "${HOME}/.copilot/agents/${skill_name}.md" "copilot"; then
      ((copilot_installed++)) || true
    else
      ((copilot_skipped++)) || true
    fi
  fi
done

# ── summary ───────────────────────────────────────────────────────────────────
echo ""
if $do_claude; then
  echo "Claude Code : $claude_installed installed, $claude_skipped already up to date"
  echo "  → Restart Claude Code (or reload the window) to pick up new skills."
fi
if $do_copilot; then
  echo "Copilot CLI : $copilot_installed installed, $copilot_skipped already up to date"
  echo "  → Skills are available as agents in GitHub Copilot CLI."
fi
