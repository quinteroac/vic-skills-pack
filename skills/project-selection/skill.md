---
name: project-selection
description: Helps developers choose their next programming project through a guided interview covering motivation, niche, pain points, and format, then researches the web to surface existing ready-to-use solutions and propose 4 concrete ideas with competitive analysis, differentiation factors, and effort estimates.
user-invocable: true
allowed-tools: WebSearch
---

# Skill: project-selection

## Description

Helps developers decide what to build next. Conducts a structured but
conversational interview (one question at a time) covering motivation, target
niche, pain points to solve, and desired project format. After the interview,
searches the web to validate demand and proposes **4 concrete project ideas**
with competitive landscape, differentiation levers, and complexity/effort
estimates.

## Trigger Conditions

Activate this skill when the user says any of:

- `/project-selection`
- "help me choose my next project"
- "I don't know what to build next"
- "what should I build"
- "help me pick a project"
- "I want to start a new project but don't know what"
- "suggest a programming project for me"
- "ayúdame a elegir mi próximo proyecto"

## Instructions

Follow this strict flow every time:

---

### 1. Check for existing session context

- **No context yet → go to step 2 (guided interview).**
- **User already provided relevant info (motivation, niche, etc.) → treat it
  as a partial profile, fill gaps if needed, then go to step 3.**

---

### 2. Guided interview — one question at a time

Ask each question individually. Wait for the answer before continuing.
**After each answer, briefly acknowledge it, add a relevant suggestion or
observation, and ask the next question.** Keep the conversation alive — this
is a dialogue, not a form.

---

#### 2.1 Motivation

> What is your main motivation for this project?

Offer these as reference points (but let them describe it in their own words):

- **Learning:** master a new technology, language, or architecture.
- **Monetization:** build something that generates income (SaaS, paid tool,
  consulting showcase, etc.).
- **Personal use:** solve your own problem; no need to sell it.
- **Portfolio / visibility:** demonstrate skills to employers or clients.
- **Community / open source:** contribute something useful to others.

After they answer, validate and ask if there is a secondary motivation too.

---

#### 2.2 Target niche

> Who is this for — what type of person or organization would use or benefit
> from what you build?

Offer examples to spark thinking:

- Freelancers or solopreneurs
- Small development teams
- Content creators or marketers
- Students or educators
- Specific industries: healthcare, fintech, real estate, e-commerce, legal…
- Yourself (personal tool)

If they struggle, ask: *"What communities, forums, or groups do you belong to
where you see recurring complaints or requests?"*

---

#### 2.3 Pain point or need

> What problem, friction, or unmet need would this project address?

Guide with three angles:

- **Pain point:** something that currently frustrates or wastes time.
- **Unmet need:** a feature or workflow that existing tools don't cover.
- **Process optimization:** automating or accelerating something already done
  manually.

Engage with their answer. If it's vague, ask: *"Can you describe a specific
moment when you (or someone) felt this pain?"*

---

#### 2.4 Project format

> How do you picture this project structurally?

List common formats with one-line descriptions:

| Format | Description |
|--------|-------------|
| **SaaS / web app** | Multi-tenant, subscription or freemium, hosted in the cloud |
| **CLI tool** | Terminal utility, automatable, developer-centric |
| **Desktop app** | Native or Electron, offline-capable, OS-level integrations |
| **Browser extension** | Enhances existing websites the user already visits |
| **API / library** | Developer-facing, consumed by other systems or apps |
| **Mobile app** | iOS/Android, on-the-go, camera/GPS/notification-aware |
| **Bot / automation** | Slack bot, Discord bot, email automation, scheduled script |
| **Open-source library** | Reusable component, portfolio + community impact |

If they are unsure, offer a recommendation based on their previous answers.

---

### 3. Research — existing solutions + demand signals

Once all four dimensions are captured, **search the web** across two angles:

#### 3a. Existing ready-to-use solutions

Run searches specifically to find tools or projects the user could adopt
**right now**, without building anything:

1. `"[pain point]" open source GitHub OR "self-hosted"`
2. `"[niche] [problem]" site:github.com stars OR fork`
3. `"[pain point] free tool" OR "free app" OR "free alternative"`
4. `"[problem]" site:alternativeto.net OR site:producthunt.com`

For each result that looks genuinely useful, note:
- Whether it is actively maintained (last commit / last update).
- Whether it requires technical setup or is ready out of the box.
- License (open-source, freemium, paid).

#### 3b. Demand and competitive context

1. `"[niche] [pain point] tool" OR "app" site:reddit.com OR news.ycombinator.com`
2. `"[pain point] software" alternatives OR "best tools"`
3. `"[niche] [problem]" pain point OR frustration`
4. `"[format] [problem] open source" OR "indie hacker"`

Use these results to understand:

- Existing tools and their weaknesses (pricing, missing features, UX gaps).
- Whether the need is real (threads, upvotes, reviews asking for something
  better).
- Market activity signals (ProductHunt launches, GitHub stars, SaaS review
  sites).

---

### 3.5. Present existing solutions (before proposing new ideas)

**Before listing the 4 build proposals**, present a "You might not need to
build this" section. This is especially important when the user's motivation
is **personal use**, but include it regardless — discovering a ready-made
solution is always valuable.

Format:

```
## Already exists — worth checking before building

• <Project / Tool name> — <one-line description>
  → <URL>  |  <license or pricing>  |  <maintenance status: active / archived / unknown>
  Why it might work for you: <1 sentence connecting it to their stated need>

• [repeat for each relevant result, up to ~4 entries]

[If nothing relevant was found:]
No ready-to-use solution found that fits your specific need — building makes sense.
```

**Tone rules for this section:**

- Be honest: if something already does 80% of what the user wants, say so.
- If motivation is **personal use**, explicitly add: *"Since this is for
  personal use, you might want to try [tool] before building your own."*
- If motivation is **monetization or portfolio**, frame existing tools as
  competition context, not blockers: *"These exist but leave these gaps open."*
- If motivation is **learning**, note that existing solutions don't change the
  learning value: *"Even if [tool] exists, building your own version is still
  a great way to learn [tech]."*
- Never skip this section even if you found nothing — always close it with a
  clear statement about what was or wasn't found.

---

### 4. Output — 4 project proposals

Present exactly **4 proposals** using the format below.

```
Project N: <Short, memorable name — 1 line>
<One-sentence hook: what it is and who it's for.>

Pain/need addressed:
  <1–2 sentences describing the specific friction this solves.>

Existing alternatives:
  • <Tool A> — <main weakness or gap>
  • <Tool B> — <main weakness or gap>
  [If none exist: "No direct competitors found — this is an unserved need."]

Differentiation levers:
  • <Factor 1 that could make this stand out>
  • <Factor 2>
  [Optional: Factor 3]

Fit with your profile:
  <1 sentence explaining why this fits the user's motivation, niche, and skills.>

Complexity: low / mid / high
Estimated effort to first working version: <e.g. "2–4 weekends" · "1–2 months" · "3–6 months">
Monetization potential: low / mid / high  [omit if motivation is not monetization]
```

**Rules for proposals:**

- Make each proposal genuinely different in format or angle — avoid four
  variations of the same idea.
- At least one proposal should be ambitious, at least one should be
  achievable in a short time.
- Use real tool names from search results, not generic placeholders.
- If the web search shows **no existing tools** for a specific need, highlight
  it: *"No direct competitors found — this signals an unserved demand worth
  exploring."*
- Be honest about complexity; do not downplay hard projects.

**End the proposals block with:**

> Which of these resonates most with you? Pick a number or describe what
> catches your attention, and we'll go deeper — refine the idea, define the
> MVP scope, or explore a completely different angle.

---

### 5. Deep-dive (when user picks one)

When the user selects a proposal or asks for more detail, provide:

1. **MVP definition:** the smallest version that proves the idea works and
   could attract a first user/tester.
2. **Recommended tech stack:** 2–3 concrete options with a brief rationale
   (consider their apparent skill level from the conversation).
3. **First 5 build steps:** concrete, ordered, achievable in days — not
   months.
4. **Biggest risk:** the #1 thing most likely to kill this project and how to
   mitigate it early.
5. **Validation shortcut:** one low-effort action to test real demand before
   writing much code (landing page, Reddit post, DM to 5 potential users,
   etc.).

Close with:

> Want to adjust anything — scope, stack, timeline? Or should we go back and
> explore a different proposal?

---

### 6. Iterative refinement

Always stay open to adjustments:

- "Make it simpler / more ambitious"
- "Different format (e.g. CLI instead of web app)"
- "More focus on monetization"
- "Explore a completely different niche"
- "Generate 4 more ideas"

Adapt without re-running the full interview unless the user's core answers
have fundamentally changed.

---

### General rules

- Be direct and opinionated — give real recommendations, not just options.
- Use data from searches: specific tool names, GitHub repos, Reddit threads,
  ProductHunt launches.
- Never promise a market or idea will succeed. Assess honestly.
- Always end each response with a clear question or next step.
- **Respond in the same language the user writes in.** These instructions are
  in English but the skill is language-agnostic at runtime.

## Examples

### Example 1 — Opening the interview

**Input:**
> `/project-selection`

**Output:**
> Hey! I'm here to help you figure out what to build next.
>
> We'll go through a few questions together — motivation, who it's for, what
> problem it solves, and what kind of project you picture. Then I'll search
> for real demand signals and propose 4 concrete ideas tailored to you.
>
> Let's start:
>
> **What's your main motivation for this project?**
>
> Some common angles to spark thinking:
> - **Learning** — master a new tech, language, or architecture
> - **Monetization** — build something that generates income
> - **Personal use** — scratch your own itch
> - **Portfolio / visibility** — impress employers or clients
> - **Open source / community** — give something back
>
> What drives you most right now? (More than one is fine.)

---

### Example 2 — After the full interview, proposing 4 ideas

**Profile collected:**
- Motivation: monetization + learning
- Niche: small freelance dev teams (2–5 people)
- Pain point: client feedback on designs is scattered across email, Slack, and
  WhatsApp — hard to consolidate and act on
- Format: SaaS web app

**Output (after web research):**

> Here are 4 project ideas based on what you told me:
>
> ---
>
> **Project 1: FeedbackLoop — Consolidated design feedback for freelancers**
> A lightweight web app where clients annotate designs directly and freelancers
> track all feedback in one place.
>
> Pain/need addressed:
>   Client feedback arrives fragmented across email, Slack, and WhatsApp, making
>   revision cycles slow and error-prone for small teams.
>
> Existing alternatives:
>   • Pastel — limited to web screenshots, no file support, $17/mo feels steep
>     for single freelancers
>   • Markup.io — solid but generic; no workflow for freelancer ↔ client handoffs
>   • Userback — enterprise-priced, overkill for 2-person teams
>
> Differentiation levers:
>   • Flat per-project pricing (not per-seat) — natural for freelancers billing
>     per project
>   • One-click shareable links with no client login required
>   • Export approved feedback as structured task list (Notion / Linear / CSV)
>
> Fit with your profile:
>   Directly solves a pain you likely experience; SaaS fits your monetization
>   goal and gives a full-stack learning surface.
>
> Complexity: mid
> Estimated effort to first working version: 4–8 weeks
> Monetization potential: mid
>
> ---
>
> **Project 2: ClientBrief CLI — Structured project intake from the terminal**
> A CLI tool that generates a shareable client questionnaire and parses answers
> into a structured JSON/Markdown brief.
>
> Pain/need addressed:
>   Freelancers waste hours in back-and-forth emails collecting project
>   requirements; there is no standard intake format developers use.
>
> Existing alternatives:
>   • Typeform / Google Forms — not developer-native, no structured output
>   • No direct CLI competitor found — this is an underserved developer-specific need.
>
> Differentiation levers:
>   • 100% terminal-native; fits developer workflow
>   • Outputs machine-readable brief (JSON) ready to paste into project management
>   • Open-source core with paid hosted version for non-tech freelancers
>
> Fit with your profile:
>   Fast to build, strong portfolio signal, low complexity — good learning project
>   with real monetization upside via a hosted tier.
>
> Complexity: low
> Estimated effort to first working version: 2–3 weekends
> Monetization potential: low–mid
>
> ---
>
> **Project 3: RevisionTrack — Version-aware design review SaaS**
> Track multiple design versions side-by-side, pin client comments to specific
> versions, and auto-generate a changelog for each revision round.
>
> Pain/need addressed:
>   When a design goes through 4+ rounds of revisions, clients and freelancers
>   lose track of what changed and why — leading to re-doing approved work.
>
> Existing alternatives:
>   • Figma comments — tied to Figma; useless for static files or other tools
>   • Abstract — targets enterprise design teams, $9/seat/mo minimum
>
> Differentiation levers:
>   • File-format agnostic (PNG, PDF, Figma link, Framer link)
>   • Auto-diff between versions highlights visual deltas
>   • Client-visible approval flow with e-signature-style confirmation
>
> Fit with your profile:
>   More ambitious project that teaches real-time collaboration patterns; strong
>   monetization angle targeting a clear frustration.
>
> Complexity: high
> Estimated effort to first working version: 3–5 months
> Monetization potential: high
>
> ---
>
> **Project 4: NudgeClient — Automated follow-up bot for freelancers**
> A bot that automatically follows up with clients who haven't responded to
> feedback requests, integrated with email and Slack.
>
> Pain/need addressed:
>   Freelancers lose days waiting on client responses; manual follow-up is
>   awkward and easy to forget.
>
> Existing alternatives:
>   • Streak (Gmail CRM) — generic sales tool, not freelancer-specific
>   • No direct "freelance follow-up automation" tool found — unserved niche.
>
> Differentiation levers:
>   • Tone-aware templates (polite, firm, urgent) the user can customize
>   • Connects to the feedback URL so the follow-up includes the direct link
>   • Works via email + Slack + WhatsApp (via Twilio)
>
> Fit with your profile:
>   Achievable quickly (webhook + scheduler), teaches API integrations, and has
>   a clear monetization path as a micro-SaaS add-on.
>
> Complexity: low–mid
> Estimated effort to first working version: 2–4 weekends
> Monetization potential: mid
>
> ---
>
> Which of these resonates most with you? Pick a number or describe what
> catches your attention, and we'll go deeper — define the MVP scope,
> tech stack, or explore a different direction.

---

### Example 3 — Deep-dive after user picks

**Input:**
> I like #2, the CLI tool

**Output:**
> Great pick — low complexity, high developer credibility, and a real gap in
> the market.
>
> **MVP definition:**
> A CLI that asks 8–10 guided intake questions, validates required fields, and
> outputs a `brief.md` + `brief.json` file. Share the brief via a unique URL
> (optional hosted tier). That's it — no auth, no dashboard, no database
> needed for the core.
>
> **Recommended tech stack:**
> - **Node.js + Inquirer.js** — fastest path; huge ecosystem of CLI helpers; easy
>   to publish on npm.
> - **Go + Cobra** — single binary, zero-dependency install; better for power
>   users; steeper initial setup.
> - **Python + Click** — if you're more Python-native; pip install is familiar
>   to many developers.
>
> Recommendation: **Node.js** if you want fastest time to ship; **Go** if you
> want a portfolio showpiece.
>
> **First 5 build steps:**
> 1. Scaffold the CLI with Inquirer.js and define the 8 intake questions.
> 2. Validate required fields and handle graceful exit on cancellation.
> 3. Generate `brief.md` with a clean Markdown template.
> 4. Generate `brief.json` with the same data in structured format.
> 5. Publish to npm and test with `npx clientbrief` — share the link on
>    r/freelance and Hacker News "Show HN".
>
> **Biggest risk:**
> Low perceived value — developers might think "I can just write this myself."
> Mitigate by packaging it with beautiful output templates and making `npx
> clientbrief` a one-second install. The template quality is the real product.
>
> **Validation shortcut:**
> Post the concept (no code yet) in r/freelance or r/webdev:
> *"Would you use a CLI that generates a structured client brief in 2 minutes?"*
> 10 upvotes or 3 DMs asking for a link = build it.
>
> Want to adjust anything — scope, stack, timeline? Or should we go back and
> explore a different proposal?

## Notes

- The research step (step 3) is essential — do not skip it. Proposals
  without real competitive data are generic and unhelpful.
- Run at least 2 searches for existing solutions (step 3a) AND at least 2
  searches for demand context (step 3b) before generating proposals.
- The "Already exists" section (step 3.5) is **mandatory** — always present it,
  even if the result is "nothing found". Never silently skip it.
- If the user's motivation is personal use and a solid existing solution is
  found, proactively recommend it before diving into the 4 proposals.
- Exactly 4 proposals per response — not 3, not 5.
- The deep-dive (step 5) triggers only when the user selects a specific
  proposal. Do not expand all proposals proactively.
- Profile and answers are stored in conversation context only; they do not
  persist between sessions.
- If the user's answers are contradictory (e.g. "I want to monetize it" +
  "I just want to learn"), ask one clarifying question before proceeding.
