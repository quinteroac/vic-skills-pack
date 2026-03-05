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

Each skill is a single `skill.md` file. The install script symlinks them into
the right place for each tool — safe to re-run at any time.

```bash
git clone <repo-url>
cd vic-skills-pack
bash scripts/install.sh          # installs for all detected tools
```

Flags to target a specific tool:

```bash
bash scripts/install.sh --claude    # Claude Code only
bash scripts/install.sh --copilot   # GitHub Copilot CLI only
```

### Claude Code

Skills are symlinked to `~/.claude/skills/<name>/SKILL.md` and become available
as slash commands. Restart Claude Code (or reload the window) after installing.

```
/create-skill
/create-skill add a skill for reviewing pull requests
```

Type `/` to browse all installed skills. Skills can also trigger automatically
when Claude detects your request matches a skill's description.

**Manual install (single skill):**

```bash
mkdir -p ~/.claude/skills/<skill-name>
ln -s "$(pwd)/skills/<skill-name>/skill.md" ~/.claude/skills/<skill-name>/SKILL.md
```

### GitHub Copilot CLI

Skills are symlinked to `~/.copilot/agents/<name>.md` and become available as
user-level agents across all repositories.

Invoke from the Copilot CLI or Copilot Chat:

```
@create-skill scaffold a skill for reviewing pull requests
```

**Manual install (single skill):**

```bash
mkdir -p ~/.copilot/agents
ln -s "$(pwd)/skills/<skill-name>/skill.md" ~/.copilot/agents/<skill-name>.md
```

## Setup (git hooks)

Clone the repo and enable the git hooks so the Skills table above stays in sync:

```bash
git clone <repo-url>
cd vic-skills-pack
git config core.hooksPath .githooks
```

The `post-commit` hook automatically regenerates the Skills table whenever a
file inside `skills/` is changed.
