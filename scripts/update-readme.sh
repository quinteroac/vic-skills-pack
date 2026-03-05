#!/usr/bin/env bash
# Regenerates the Skills section in README.md based on skills/*/skill.md

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
README="$REPO_ROOT/README.md"
SKILLS_DIR="$REPO_ROOT/skills"

# Build skills table lines
rows=""
for skill_file in "$SKILLS_DIR"/*/skill.md; do
  [ -f "$skill_file" ] || continue
  skill_name="$(basename "$(dirname "$skill_file")")"
  description="$(awk '/^## Description/{found=1; next} found && /^##/{exit} found && NF{printf "%s ", $0}' "$skill_file" | sed 's/[[:space:]]*$//' | grep -oP '^[^.]+\.' | head -1)"
  rows+="| [\`${skill_name}\`](skills/${skill_name}/skill.md) | ${description} |\n"
done

block="## Skills\n\n| Skill | Description |\n|-------|-------------|\n${rows}"

python3 - "$README" "$block" <<'EOF'
import sys, re

readme_path = sys.argv[1]
block = sys.argv[2]

with open(readme_path) as f:
    content = f.read()

replacement = f"<!-- skills-start -->\n\n{block}\n<!-- skills-end -->"
content = re.sub(
    r"<!-- skills-start -->.*?<!-- skills-end -->",
    replacement,
    content,
    flags=re.DOTALL,
)

with open(readme_path, "w") as f:
    f.write(content)

print("README.md updated.")
EOF
