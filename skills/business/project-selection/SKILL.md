---
name: project-selection
description: Helps developers choose their next programming project through a guided interview covering motivation, niche, pain points, and format, then researches the web to surface existing ready-to-use solutions and propose 4 concrete ideas with competitive analysis, differentiation factors, and effort estimates. Use when the user says "help me choose my next project", "I don't know what to build next", "what should I build", "help me pick a project", "suggest a programming project for me", "ayúdame a elegir mi próximo proyecto", or asks for project ideas without a clear direction.
user-invocable: true
allowed-tools: WebSearch
---

# Skill: project-selection

Helps developers decide what to build next. Conducts a structured but
conversational interview (one question at a time) covering motivation, target
niche, pain points, and desired project format. After the interview, searches
the web to validate demand and proposes **4 concrete project ideas** with
competitive landscape, differentiation levers, and complexity/effort
estimates.

## Instructions

### 1. Check for existing session context

- **No context yet → go to step 2 (guided interview).**
- **User already provided relevant info** (motivation, niche, etc.) → treat
  as a partial profile, fill gaps if needed, then go to step 3.

### 2. Guided interview — one question at a time

Ask each question individually. Wait for the answer before continuing.
**After each answer, briefly acknowledge it, add a relevant observation, and
ask the next question.** Keep the conversation alive — this is a dialogue,
not a form.

#### 2.1 Motivation

> What is your main motivation for this project?

Offer these as reference points (let them describe it in their own words):
- **Learning:** master a new technology, language, or architecture.
- **Monetization:** build something that generates income.
- **Personal use:** solve your own problem; no need to sell it.
- **Portfolio / visibility:** demonstrate skills to employers or clients.
- **Community / open source:** contribute something useful to others.

After they answer, validate and ask if there is a secondary motivation too.

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

#### 2.3 Pain point or need

> What problem, friction, or unmet need would this project address?

Guide with three angles:
- **Pain point:** something that currently frustrates or wastes time.
- **Unmet need:** a feature or workflow that existing tools don't cover.
- **Process optimization:** automating or accelerating something done
  manually.

If vague, ask: *"Can you describe a specific moment when you (or someone)
felt this pain?"*

#### 2.4 Project format

> How do you picture this project structurally?

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

### 3. Research — existing solutions + demand signals

Once all four dimensions are captured, **search the web** across two angles.
Running real searches grounds the proposals in actual market data rather than
generic guesses.

#### 3a. Existing ready-to-use solutions

Run searches to find tools or projects the user could adopt **right now**,
without building anything:

1. `"[pain point]" open source GitHub OR "self-hosted"`
2. `"[niche] [problem]" site:github.com stars OR fork`
3. `"[pain point] free tool" OR "free app" OR "free alternative"`
4. `"[problem]" site:alternativeto.net OR site:producthunt.com`

For each relevant result, note: maintenance status, ease of setup, and
license.

#### 3b. Demand and competitive context

1. `"[niche] [pain point] tool" OR "app" site:reddit.com OR news.ycombinator.com`
2. `"[pain point] software" alternatives OR "best tools"`
3. `"[niche] [problem]" pain point OR frustration`
4. `"[format] [problem] open source" OR "indie hacker"`

Use results to understand existing tools and their weaknesses, whether the
need is real (threads, upvotes, reviews), and market activity signals.

### 3.5. Present existing solutions (before proposing new ideas)

**Before listing the 4 build proposals**, present a "You might not need to
build this" section — discovering a ready-made solution is always valuable,
regardless of motivation.

Format:

```
## Already exists — worth checking before building

• <Project / Tool name> — <one-line description>
  → <URL>  |  <license or pricing>  |  <maintenance: active / archived / unknown>
  Why it might work for you: <1 sentence connecting it to their stated need>

[repeat for each relevant result, up to ~4 entries]

[If nothing relevant was found:]
No ready-to-use solution found that fits your specific need — building makes sense.
```

Tone rules:
- If motivation is **personal use**, add: *"Since this is for personal use,
  you might want to try [tool] before building your own."*
- If motivation is **monetization or portfolio**, frame existing tools as
  competition context: *"These exist but leave these gaps open."*
- If motivation is **learning**, note: *"Even if [tool] exists, building your
  own version is still a great way to learn [tech]."*
- Never skip this section — always close it with a clear statement about
  what was or wasn't found.

### 4. Output — 4 project proposals

Present exactly **4 proposals** using the format below. Four is enough to
show range without overwhelming the decision; more would dilute focus.

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

Fit with your profile:
  <1 sentence explaining why this fits the user's motivation, niche, and skills.>

Complexity: low / mid / high
Estimated effort to first working version: <e.g. "2–4 weekends" · "1–2 months">
Monetization potential: low / mid / high  [omit if motivation is not monetization]
```

Rules:
- Make each proposal genuinely different in format or angle — avoid four
  variations of the same idea.
- At least one proposal should be ambitious, at least one achievable quickly.
- Use real tool names from search results, not generic placeholders.
- Be honest about complexity; do not downplay hard projects.

**End the proposals block with:**

> Which of these resonates most with you? Pick a number or describe what
> catches your attention, and we'll go deeper — refine the idea, define the
> MVP scope, or explore a completely different angle.

### 5. Deep-dive (when user picks one)

When the user selects a proposal or asks for more detail, provide:

1. **MVP definition:** the smallest version that proves the idea works and
   could attract a first user/tester.
2. **Recommended tech stack:** 2–3 concrete options with brief rationale
   (consider their apparent skill level from the conversation).
3. **First 5 build steps:** concrete, ordered, achievable in days — not
   months.
4. **Biggest risk:** the #1 thing most likely to kill this project and how
   to mitigate it early.
5. **Validation shortcut:** one low-effort action to test real demand before
   writing much code (landing page, Reddit post, DM to 5 potential users,
   etc.).

Close with:

> Want to adjust anything — scope, stack, timeline? Or should we go back and
> explore a different proposal?

### 6. Iterative refinement

Stay open to adjustments:
- "Make it simpler / more ambitious"
- "Different format (e.g. CLI instead of web app)"
- "More focus on monetization"
- "Explore a completely different niche"
- "Generate 4 more ideas"

Adapt without re-running the full interview unless the user's core answers
have fundamentally changed.

### General rules

- Be direct and opinionated — give real recommendations, not just options.
- Use data from searches: specific tool names, GitHub repos, Reddit threads,
  ProductHunt launches.
- Never promise a market or idea will succeed. Assess honestly.
- Always end each response with a clear question or next step.
- **Respond in the same language the user writes in.** These instructions are
  in English but the skill is language-agnostic at runtime.

## Notes

- The research step (step 3) is essential — do not skip it. Proposals
  without real competitive data are generic and unhelpful.
- The "Already exists" section (step 3.5) is **mandatory** — always present
  it, even if the result is "nothing found".
- Exactly 4 proposals per response — not 3, not 5.
- The deep-dive (step 5) triggers only when the user selects a specific
  proposal. Do not expand all proposals proactively.
- Profile and answers are stored in conversation context only; they do not
  persist between sessions.
- If the user's answers are contradictory (e.g. "I want to monetize it" +
  "I just want to learn"), ask one clarifying question before proceeding.
