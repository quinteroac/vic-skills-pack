# Skill: create-skill

## Description

Guides the user through creating a new skill for this repository. Scaffolds the
required directory structure, populates `skill.md` with all mandatory sections,
and enforces the repo conventions defined in `AGENTS.md`.

## Trigger Conditions

Activate this skill when the user says any of:

- "create a new skill"
- "add a skill for …"
- "scaffold a skill"
- `/create-skill`

## Instructions

Follow these steps in order:

### 1. Gather information

Ask the user for:

| Field | Description | Example |
|-------|-------------|---------|
| `name` | Skill name in kebab-case | `code-review` |
| `description` | One-sentence summary of what the skill does | `Reviews a diff and suggests improvements` |
| `triggers` | Phrases or slash-command that activate the skill | `"review my code"`, `/review` |

### 2. Create the directory structure

```
skills/
└── <name>/
    ├── skill.md      # Required — skill definition
    └── assets/       # Optional — prompts, templates, examples
```

### 3. Populate skill.md

Every `skill.md` **must** contain the following sections in this order:

```markdown
# Skill: <name>

## Description
<one-sentence summary>

## Trigger Conditions
<list of phrases or slash-commands that activate the skill>

## Instructions
<step-by-step instructions the agent must follow>

## Examples
<at least one input → expected output example>

## Notes  *(optional)*
<caveats, known limitations, related skills>
```

### 4. Validate before committing

- [ ] File is located at `skills/<name>/skill.md`
- [ ] All content is in English
- [ ] Name is kebab-case
- [ ] All required sections are present
- [ ] At least one example is included

### 5. Commit

Use a descriptive commit message:

```
Add skill: <name>
```

## Examples

### Input

> "Create a skill for summarizing pull requests"

### Output

```
skills/
└── summarize-pr/
    └── skill.md
```

`skill.md` scaffolded with: description, trigger `"summarize this PR"` /
`/summarize-pr`, step-by-step instructions for fetching PR diff and producing a
structured summary, and one end-to-end example.

## Notes

- Always check `skills/` for an existing skill with a similar name before
  creating a new one to avoid duplication.
- If the skill requires external tools or APIs, add a `dependencies` section to
  `skill.md` and consider adding the tool under `tools/`.
