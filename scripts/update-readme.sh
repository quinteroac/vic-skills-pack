#!/usr/bin/env bash
# Regenerates the Skills section in README.md based on skills/*/SKILL.md
# Supports both flat (skills/<name>/SKILL.md) and categorized
# (skills/<category>/<name>/SKILL.md) layouts.

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
README="$REPO_ROOT/README.md"
SKILLS_DIR="$REPO_ROOT/skills"

# Build skills table lines
rows=""
while IFS= read -r skill_file; do
  [ -f "$skill_file" ] || continue
  skill_dir="$(dirname "$skill_file")"
  skill_name="$(basename "$skill_dir")"
  category_dir="$(dirname "$skill_dir")"
  category="$(basename "$category_dir")"

  # Determine relative path and category label
  if [ "$category_dir" = "$SKILLS_DIR" ]; then
    # Flat layout — skill is directly under skills/
    category="—"
    rel_path="skills/${skill_name}/SKILL.md"
  else
    # Categorized layout — skill is under skills/<category>/
    rel_path="skills/${category}/${skill_name}/SKILL.md"
  fi

  # Extract first sentence of description from YAML frontmatter
  description="$(grep '^description:' "$skill_file" | head -1 | sed 's/^description:[[:space:]]*//' | grep -oP '^[^.]+\.' | head -1)"
  rows+="| [\`${skill_name}\`](${rel_path}) | \`${category}\` | ${description} |\n"
done < <(find "$SKILLS_DIR" -name "SKILL.md" -mindepth 2 -maxdepth 3 | sort)

block="## Skills\n\n| Skill | Category | Description |\n|-------|----------|-------------|\n${rows}"

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
