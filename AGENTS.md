# Agents

All artifacts in this repository must be written in English.

## Repository Structure

```
vic-skills-pack/
├── AGENTS.md               # This file — agents overview and repo conventions
├── README.md               # General repo description
│
├── skills/                 # Skills organized by category
│   └── <category>/         # e.g. ui/, business/, meta/
│       └── <skill-name>/
│           ├── SKILL.md    # Required — skill definition (frontmatter + instructions)
│           ├── scripts/    # Optional — executable helpers for deterministic tasks
│           ├── references/ # Optional — reference docs loaded into context on demand
│           └── assets/     # Optional — templates, icons, fonts used in output
│
└── scripts/                # Repo-level utilities (install, update-readme, etc.)
```

### Category conventions

Skills live under a category folder inside `skills/`. Use short, lowercase, kebab-case category names. Current categories:

| Category   | Purpose |
|------------|---------|
| `ui/`      | Frontend, rendering, design systems, and visual tooling |
| `business/`| Market research, project planning, and strategy |
| `meta/`    | Skills that help create or manage other skills |

Add a new category only when no existing one fits. Avoid over-splitting (one skill per category is a smell).

### Directory rationale

| Directory     | Purpose |
|---------------|---------|
| `skills/`     | Each skill lives in its own folder so it can carry its own resources and evolve independently. |
| `scripts/`    | Executable helpers used by skills for deterministic tasks (parsing, aggregation, etc.). |
| `references/` | Documentation or schemas loaded into context only when the skill needs them. |
| `assets/`     | Static files used in skill output: templates, icons, HTML viewers. |

## Conventions

- All file content must be in **English**.
- Skill names use **kebab-case** (e.g. `code-review`, `commit-helper`).
- The skill definition file is always named **`SKILL.md`** (uppercase).
- Only create subdirectories (`scripts/`, `references/`, `assets/`) when the skill actually uses them.

## SKILL.md standard

Every `SKILL.md` must start with YAML frontmatter followed by markdown instructions.

### Frontmatter fields

| Field           | Required | Description |
|-----------------|----------|-------------|
| `name`          | yes      | Kebab-case name; becomes the slash command `/name` |
| `description`   | yes      | Pushy, multi-phrase description used for auto-discovery and triggering |
| `user-invocable`| yes      | Set to `true` to show in the `/` command menu |
| `allowed-tools` | no       | Tools Claude may use without prompting (e.g. `WebSearch`) |
| `argument-hint` | no       | Autocomplete hint shown in the slash menu (e.g. `[issue-number]`) |

### Writing a good description

The description is the primary trigger mechanism. Write it to be **pushy**:
- State clearly what the skill does in the first sentence.
- List the varied phrases users are likely to say.
- Name specific contexts where the skill applies.
- Aim for 50–120 words to combat undertriggering.

### Writing good instructions

- Use the **imperative form**: "Read the file", not "You should read the file".
- Explain the **why** behind each step — models that understand the reason apply
  instructions more accurately across varied contexts than models following blind rules.
- Keep `SKILL.md` under **500 lines** total.
- Remove any instruction that isn't actively pulling its weight.
- Use bundled `references/` for large reference material instead of inlining it.

### Progressive disclosure

Skills load in three levels:
1. **Metadata** (`name` + `description`) — always in context, ~100 words.
2. **SKILL.md body** — loaded when the skill triggers, keep under 500 lines.
3. **Bundled resources** (`scripts/`, `references/`, `assets/`) — loaded on demand.
