# vic-skills-pack

A curated set of personal Claude Code skills.

## Repository Structure

```
vic-skills-pack/
├── AGENTS.md           # Repo conventions and agent guidelines
├── README.md           # This file
├── skills/             # One directory per skill
│   └── <skill-name>/
│       ├── SKILL.md    # Skill definition (frontmatter + instructions)
│       ├── scripts/    # Optional — executable helpers
│       ├── references/ # Optional — reference docs loaded on demand
│       └── assets/     # Optional — templates, icons, fonts
└── scripts/            # Maintenance scripts
```

<!-- skills-start -->

## Skills

| Skill | Description |
|-------|-------------|
| [`create-skill`](skills/create-skill/SKILL.md) | Scaffold and create a new skill for this repository. |

<!-- skills-end -->

## Installation

### Recommended — `npx skills`

Install directly from this repository using the [`skills`](https://github.com/vercel-labs/skills) CLI.
No cloning required; the command points to this repo on GitHub:

```bash
npx skills add quinteroac/vic-skills-pack
```

Install globally (available across all projects):

```bash
npx skills add quinteroac/vic-skills-pack -g
```

Install only for Claude Code:

```bash
npx skills add quinteroac/vic-skills-pack --agent claude-code
```

Install a single skill by name:

```bash
npx skills add quinteroac/vic-skills-pack --skill market-scout
```

After installing, restart Claude Code (or reload the window) to pick up the
new skills. Type `/` to browse them or invoke them by name:

```
/market-scout
/project-selection
/create-skill add a skill for reviewing pull requests
```

---

### Alternative — `scripts/install.sh`

Clone the repo and run the install script to symlink skills locally:

```bash
git clone https://github.com/quinteroac/vic-skills-pack
cd vic-skills-pack
bash scripts/install.sh          # installs for all detected tools
```

Flags to target a specific tool:

```bash
bash scripts/install.sh --claude    # Claude Code only
bash scripts/install.sh --copilot   # GitHub Copilot CLI only
```

Skills are symlinked to `~/.claude/skills/<name>/SKILL.md`. To update,
`git pull` and re-run the script.

---

## Setup (git hooks)

Enable the git hooks so the Skills table above stays in sync after each
commit:

```bash
git config core.hooksPath .githooks
```

The `post-commit` hook automatically regenerates the Skills table whenever a
file inside `skills/` changes.
