---
name: create-skill
description: Scaffold and create a new skill for this repository. Use when the user says "create a new skill", "add a skill for...", "scaffold a skill", "I want to build a skill that...", "make a skill that does X", "help me add a capability", or whenever they want to add a new capability to this skills pack. Also use when improving the structure of an existing skill.
user-invocable: true
---

# Skill: create-skill

Guides the user through building a skill that follows the repository standard:
a `SKILL.md` with a pushy description, imperative instructions that explain
the "why", and optional bundled resources.

## Instructions

### 1. Capture intent

Ask what the skill should do, when it should trigger, and what its output
looks like. Keep this conversational — one or two questions, not a form.

Specifically understand:
- **What it does**: the core action or workflow
- **When it triggers**: the phrases or contexts that activate it
- **What it produces**: the format and content of the output

Don't push test cases on first-time skill authors. Mention them only if the
user seems interested in measuring quality.

### 2. Choose a name

Skill names become slash commands, so they must be:
- **kebab-case** (`code-review`, not `codeReview` or `code_review`)
- **descriptive but short** — one to three words
- **unique** — check `skills/` for existing skills with overlapping scope

### 3. Create the directory structure

```
skills/
└── <name>/
    ├── SKILL.md        # Required — skill definition
    ├── scripts/        # Optional — executable helpers for deterministic tasks
    ├── references/     # Optional — reference docs loaded into context on demand
    └── assets/         # Optional — templates, icons, fonts used in output
```

Create only the subdirectories the skill actually needs. Empty folders add
noise without value.

### 4. Write SKILL.md

Every `SKILL.md` starts with YAML frontmatter, then markdown instructions:

```markdown
---
name: <kebab-case-name>
description: <pushy, multi-phrase description — see below>
user-invocable: true
[allowed-tools: ToolName]   # optional
[argument-hint: [hint]]     # optional
---

# Skill: <name>

<One-sentence tagline: what it does and who it's for.>

## Instructions

<Step-by-step, imperative form. Explain the **why** behind each step.>
```

#### Writing a good description

The description is the primary trigger mechanism — it determines whether
Claude invokes the skill. Make it **pushy**:
- State what the skill does clearly in the first sentence.
- List the trigger phrases users are likely to say (varied phrasings,
  different intents, different levels of specificity).
- Name the specific contexts where the skill applies.
- Aim for 50–120 words.

**Weak description:**
> "Helps create skills."

**Strong description:**
> "Scaffold and create a new skill for this repository. Use when the user
> says 'create a new skill', 'add a skill for...', 'scaffold a skill', 'I
> want to build a skill that...', 'make a skill that does X', or whenever
> they want to add a new capability to this skills pack."

#### Writing good instructions

- Use the **imperative form**: "Read the file", not "You should read".
- Explain the **why**: "Ask one question at a time — this keeps the
  conversation natural and prevents the user from feeling interrogated."
- Keep the total file under **500 lines**.
- Remove any instruction that isn't actively pulling its weight; lean prompts
  outperform verbose ones.
- Put large reference material in `references/` instead of inlining it.

#### Frontmatter fields

| Field            | Required | Description |
|------------------|----------|-------------|
| `name`           | yes      | Becomes the slash command `/name` |
| `description`    | yes      | Pushy, multi-phrase trigger description |
| `user-invocable` | yes      | `true` to show in the `/` menu |
| `allowed-tools`  | no       | Tools Claude may use without prompting |
| `argument-hint`  | no       | Autocomplete hint, e.g. `[issue-number]` |

### 5. Validate before committing

- [ ] File is at `skills/<name>/SKILL.md`
- [ ] YAML frontmatter is present and valid
- [ ] `name` matches the directory name
- [ ] Description is pushy (50+ words, multiple trigger phrasings)
- [ ] Instructions use imperative form and explain the why
- [ ] All content is in English
- [ ] No empty subdirectories created

### 6. Commit

```
Add skill: <name>
```

Remind the user to run `scripts/install.sh` to make the new skill available
in Claude Code immediately.
