# vic-skills-pack

A curated set of personal Claude Code skills.

## Repository Structure

```
vic-skills-pack/
├── AGENTS.md           # Repo conventions and agent guidelines
├── README.md           # This file
├── skills/             # One directory per skill
│   └── <skill-name>/
│       ├── skill.md   # Skill definition (trigger, instructions, examples)
│       └── assets/    # Optional supporting files
├── tools/              # Reusable tools or MCP integrations
├── scripts/            # Maintenance scripts
│   └── update-readme.sh
└── docs/               # Cross-cutting documentation
```

<!-- skills-start -->

## Skills

| Skill | Description |
|-------|-------------|
| [`create-skill`](skills/create-skill/skill.md) | Guides the user through creating a new skill for this repository. |

<!-- skills-end -->

## Setup

Clone the repo and enable the git hooks:

```bash
git clone <repo-url>
cd vic-skills-pack
git config core.hooksPath .githooks
```

The `post-commit` hook will automatically regenerate the Skills table above
whenever a file inside `skills/` is changed.
