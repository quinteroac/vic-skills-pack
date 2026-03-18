#!/usr/bin/env bash
# Regenerates the Skills section in README.md based on skills/*/SKILL.md

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
README="$REPO_ROOT/README.md"
SKILLS_DIR="$REPO_ROOT/skills"

# Build skills table lines
rows=""
for skill_file in "$SKILLS_DIR"/*/SKILL.md; do
  [ -f "$skill_file" ] || continue
  skill_name="$(basename "$(dirname "$skill_file")")"
  # Extract first sentence of description from YAML frontmatter
  description="$(grep '^description:' "$skill_file" | head -1 | sed 's/^description:[[:space:]]*//' | grep -oP '^[^.]+\.' | head -1)"
  rows+="| [\`${skill_name}\`](skills/${skill_name}/SKILL.md) | ${description} |\n"
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
