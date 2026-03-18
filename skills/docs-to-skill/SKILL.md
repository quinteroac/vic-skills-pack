---
name: docs-to-skill
description: Creates an agent skill from the official documentation of any tool, library, or API. Use when the user shares a documentation link and wants to turn it into an installable skill, when they say "I want a skill for X", "create a skill from this doc", "make a skill from [URL]", "we need our agents to work with X", "turn this documentation into a skill", or when they want their agents to understand a specific tool — even if they don't explicitly use the word "skill".
user-invocable: true
---

# Skill: docs-to-skill

Reads the official documentation of a tool, library, or API and produces a
skill that lets agents orient themselves quickly — understanding what the
product does, how to install it, and where to go for any specific need. You
are not documenting the tool; you are creating a navigation map for agents.

## Instructions

### 1. Read the documentation

Use Jina Reader to fetch the URL the user provides. Prefix `r.jina.ai/` to
convert any URL to clean markdown without ads, navigation noise, or
JavaScript clutter:

```
r.jina.ai/https://getbootstrap.com/docs/5.3/getting-started/introduction/
```

From that single page, extract:
1. **X-ray** — what the product is, what problem it solves, and how its
   documentation is organized
2. **Quick start** — how to install it and the minimal working example

Don't follow links yet. The navigation structure of the entry page (table of
contents, sidebar sections) already gives you the map of what exists — use
that. Ignore changelog, blog, pricing, community, and advanced examples on
this first pass.

Fetching just one page keeps the skill lean and fast to generate. The user
can request deeper coverage of specific sections afterwards.

### 2. Generate the skill file

Create `SKILL.md` inside `skills/[product-name]-docs/`.

The skill must contain:
- **What it is** — what the product is and what problem it solves (2–3 lines
  max)
- **Quick start** — installation and minimal working example with code
- **What it gives you** — the main capability areas, without deep detail
- **Documentation map** — a table with key sections, one-line descriptions,
  and their URLs

Keep it concise. A future agent reading this skill needs to orient itself and
know exactly where to go for any need — not already know everything.

The frontmatter:

```markdown
---
name: [product-name]-docs
description: [one-sentence summary of the product and what agents can do with this skill]
---
```

### 3. Present and dialogue

Once v1 is ready, present it and say:

> "Here's the base skill for [product]. It covers what it is, how to install
> it, and a map of the documentation. Should we keep it as is, or would you
> like me to go deeper on any specific area?"

The user decides from here:
- **Keep it** — the generic orientation skill is sufficient
- **Enrich it** — go deeper on a section; fetch that specific URL with Jina
  and incorporate the detail into this same skill
- **Specialize it** — create a separate, narrower skill (e.g.
  `stripe-webhooks-docs`) in its own folder for a focused use case

Listen more than generate in this phase. The user knows which capabilities
their agents actually need.

### 4. Validate before committing

- [ ] File is at `skills/[product-name]-docs/SKILL.md`
- [ ] YAML frontmatter is valid, `name` matches directory name
- [ ] All four sections are present (What it is, Quick start, What it gives
      you, Documentation map)
- [ ] Documentation map includes URLs

### 5. Commit

```
Add skill: [product-name]-docs
```

Remind the user to run `scripts/install.sh` to make the skill available.

## Notes

- Always use `r.jina.ai/` — it strips noise and returns clean markdown.
- Fetch one page per step; the entry page structure is sufficient for v1.
- Specialized skills (e.g. `stripe-webhooks-docs`) live in their own
  directory and are narrower in scope — they complement, not replace, the
  base skill.
