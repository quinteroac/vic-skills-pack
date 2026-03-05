# Agents

All artifacts in this repository must be written in English.

## Proposed Repository Structure

```
vic-skills-pack/
├── agents.md               # This file — agents overview and repo conventions
├── README.md               # General repo description
│
├── skills/                 # One subdirectory per skill
│   ├── <skill-name>/
│   │   ├── skill.md        # Skill definition (trigger, instructions, examples)
│   │   └── assets/         # Optional: prompts, templates, or supporting files
│   └── ...
│
├── tools/                  # Reusable tools or MCP integrations
│   └── <tool-name>/
│       └── ...
│
└── docs/                   # Supporting documentation
    └── conventions.md      # Naming, formatting, and style guidelines
```

### Rationale

| Directory | Purpose |
|-----------|---------|
| `skills/` | Each skill lives in its own folder so it can carry its own assets and evolve independently. |
| `tools/`  | External tools or MCP servers that skills may depend on. |
| `docs/`   | Cross-cutting documentation: conventions, contribution guidelines, etc. |

## Conventions

- All file content must be in **English**.
- Skill names use **kebab-case** (e.g. `code-review`, `commit-helper`).
- Each `skill.md` must include at minimum: a description, trigger conditions, and at least one usage example.
