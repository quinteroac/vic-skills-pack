# vic-skills-pack

A curated set of personal Claude Code skills.

## Repository Structure

```
vic-skills-pack/
├── AGENTS.md               # Repo conventions and agent guidelines
├── README.md               # This file
├── skills/                 # Skills organized by category
│   └── <category>/         # e.g. ui/, business/, meta/
│       └── <skill-name>/
│           ├── SKILL.md    # Skill definition (frontmatter + instructions)
│           ├── scripts/    # Optional — executable helpers
│           ├── references/ # Optional — reference docs loaded on demand
│           └── assets/     # Optional — templates, icons, fonts
└── scripts/                # Maintenance scripts
```

<!-- skills-start -->

## Skills

| Skill | Category | Description |
|-------|----------|-------------|
| [`market-scout`](skills/business/market-scout/SKILL.md) | `business` | Helps entrepreneurs discover viable markets quickly through a guided profiling interview, then recommends 3–5 tailored market opportunities in a lean, actionable format. |
| [`project-selection`](skills/business/project-selection/SKILL.md) | `business` | Helps developers choose their next programming project through a guided interview covering motivation, niche, pain points, and format, then researches the web to surface existing ready-to-use solutions and propose 4 concrete ideas with competitive analysis, differentiation factors, and effort estimates. |
| [`create-skill`](skills/meta/create-skill/SKILL.md) | `meta` | Scaffold and create a new skill for this repository. |
| [`docs-to-skill`](skills/meta/docs-to-skill/SKILL.md) | `meta` | Creates an agent skill from the official documentation of any tool, library, or API. |
| [`docusaurus-docs`](skills/ui/docusaurus-docs/SKILL.md) | `ui` | Skill for building documentation websites with Docusaurus — helps agents scaffold sites, configure plugins/themes, write content in MDX, and deploy to platforms like Vercel, Netlify, or GitHub Pages. |
| [`pretext-art`](skills/ui/pretext-art/SKILL.md) | `ui` | Generates creative and artistic text layout code using @chenglou/pretext — for kinetic typography, text-along-a-path, generative type art, text masking, shaped text containers, wavy/curved text, typographic posters, and custom Canvas/SVG text rendering. |
| [`pretext-docs`](skills/ui/pretext-docs/SKILL.md) | `ui` | API reference for @chenglou/pretext — a pure JS/TS library for measuring and laying out multiline text without DOM reflows. |
| [`pretext-integrate`](skills/ui/pretext-integrate/SKILL.md) | `ui` | Guides implementation of @chenglou/pretext in a real project — asks a few targeted questions about rendering target, data shape, and performance context, then generates correct, complete integration code. |

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
