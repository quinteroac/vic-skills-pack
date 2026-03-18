---
name: docs-to-skill
description: Creates an agent skill from the official documentation of any tool, library or API. Use this when the user shares a documentation link and wants to turn it into an installable skill, when they say "I want a skill for X", "create a skill from this doc", "we need our agents to work with X", or when they want their agents to be able to use a specific tool even if they don't explicitly mention the word "skill".
user-invocable: true
---

# Skill: docs-to-skill

## Description

Reads the official documentation of any tool, library, or API and produces a
skill that allows other agents to understand what that tool is, what it can do,
and how to navigate its documentation. You are not documenting the tool — you
are creating a navigation map for agents.

## Trigger Conditions

Activate this skill when the user says any of:

- "create a skill from this doc"
- "I want a skill for X"
- "we need our agents to work with X"
- "turn this documentation into a skill"
- "make a skill from [URL]"
- `/docs-to-skill`
- User shares a documentation link with intent to create a skill

## Instructions

Follow these steps in order:

### 1. Read the documentation

Use Jina Reader to fetch the URL the user provides. Prefix `r.jina.ai/` to the
link:

```
r.jina.ai/https://getbootstrap.com/docs/5.3/getting-started/introduction/
```

Jina returns clean markdown. From that single page, extract:

1. **X-ray** — what the product is, what problem it solves, what it can do, how
   its documentation is organized
2. **Quick start** — how to install it and the minimal working example

Do not follow links yet. The navigation structure of the page (table of
contents, sidebar sections) already gives you the map of what exists — use
that.

**Ignore in this pass:** changelog, blog, pricing, community, advanced
examples.

### 2. Generate the skill file

Create a `skill.md` inside `skills/[product-name]-docs/`.

The skill must contain:

- **What it is** — what the product is and what problem it solves (2-3 lines
  max)
- **Quick start** — installation and minimal working example with code
- **What it gives you** — the main capability areas, without going into detail
- **Documentation map** — a table with the key sections, one-line description
  each, and their URLs

Keep it concise. A future agent reading this skill should be able to orient
itself and know exactly where to go for any specific need — not know everything
already.

The frontmatter must follow repo conventions:

```markdown
---
name: [product-name]-docs
description: [one-sentence summary of the product and what it enables agents to do]
---
```

### 3. Present and dialogue

Once the v1 is ready, present it to the user and say:

> "Here's the base skill for [product]. It covers what it is, how to install
> it, and a map of the documentation. Should we keep it as is, or would you
> like me to go deeper on any specific area?"

From there the user decides:

- **Keep it** — the generic skill is good enough as is
- **Enrich it** — go deeper on a specific section, which adds detail to this
  same skill. Fetch the relevant URL with Jina and incorporate what you learn.
- **Specialize it** — create a separate, more focused skill for a specific
  purpose (e.g. `bootstrap-forms-docs`, `stripe-webhooks-docs`). This new
  skill lives in its own folder and is scoped to that use case.

Follow the user's lead. In this phase, listen more than generate.

### 4. Validate before committing

- [ ] File is located at `skills/[product-name]-docs/skill.md`
- [ ] YAML frontmatter is present and valid
- [ ] `name` matches the directory name
- [ ] All required sections are present (What it is, Quick start, What it gives
      you, Documentation map)
- [ ] Documentation map includes URLs

### 5. Commit

Use a descriptive commit message:

```
Add skill: [product-name]-docs
```

## Examples

### Input

> "Here's the Stripe docs: https://stripe.com/docs — create a skill for it"

### Output

```
skills/
└── stripe-docs/
    └── skill.md
```

`skill.md` scaffolded with: YAML frontmatter (`name: stripe-docs`), what Stripe
is and what problem it solves, quick start with API key setup and first charge
example, capability areas (Payments, Subscriptions, Connect, etc.), and a
documentation map table with URLs to each major section.

Agent then asks:

> "Here's the base skill for Stripe. It covers what it is, how to install it,
> and a map of the documentation. Should we keep it as is, or would you like me
> to go deeper on any specific area?"

---

### Input

> "I want a skill for Bootstrap 5"

### Output

Agent fetches `r.jina.ai/https://getbootstrap.com/docs/5.3/getting-started/introduction/`,
extracts product overview and quick start, creates
`skills/bootstrap-docs/skill.md`, then asks if the user wants to enrich or
specialize it.

## Notes

- Always use `r.jina.ai/` to fetch documentation — it returns clean markdown
  without noise.
- Only fetch one page per step. The navigation structure of the entry page is
  enough for v1.
- If the user wants to enrich the skill, fetch the specific section URL rather
  than re-fetching everything.
- Specialized skills (e.g. `stripe-webhooks-docs`) live in their own directory
  and are narrower in scope — they are not replacements for the base skill.
- After creating the skill, run `scripts/install.sh` to make it available to
  Claude Code immediately.
