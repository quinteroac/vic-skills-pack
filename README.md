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

## Installation

Skills in this repo are Claude Code slash commands. Installing them makes them
available as `/skill-name` in any Claude Code session.

### Quick install (recommended)

```bash
git clone <repo-url>
cd vic-skills-pack
bash scripts/install.sh
```

The script symlinks every `skills/<name>/skill.md` to
`~/.claude/skills/<name>/SKILL.md`. Restart Claude Code (or reload the window)
after running it.

To update after pulling new skills:

```bash
bash scripts/install.sh   # safe to re-run, skips already-linked skills
```

### Manual install

To install a single skill without the script:

```bash
mkdir -p ~/.claude/skills/<skill-name>
ln -s "$(pwd)/skills/<skill-name>/skill.md" ~/.claude/skills/<skill-name>/SKILL.md
```

### Invoking a skill

Once installed, type `/` in Claude Code to see available skills, or invoke
directly:

```
/create-skill
/create-skill add a skill for reviewing pull requests
```

Skills can also be triggered automatically when Claude detects your request
matches a skill's description.

## Setup (git hooks)

Clone the repo and enable the git hooks so the Skills table above stays in sync:

```bash
git clone <repo-url>
cd vic-skills-pack
git config core.hooksPath .githooks
```

The `post-commit` hook automatically regenerates the Skills table whenever a
file inside `skills/` is changed.
