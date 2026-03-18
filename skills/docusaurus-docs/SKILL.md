---
name: docusaurus-docs
description: Skill for building documentation websites with Docusaurus — helps agents scaffold sites, configure plugins/themes, write content in MDX, and deploy to platforms like Vercel, Netlify, or GitHub Pages.
---

# Docusaurus Docs

## What it is

Docusaurus is an open-source static site generator by Meta, optimized for building documentation websites. It uses React and MDX, supports versioning, i18n, search, and theming out of the box — letting teams focus on content rather than infrastructure.

## Quick start

**Requirements:** Node.js ≥ 18.0

```bash
# Scaffold a new site with the classic preset
npx create-docusaurus@latest my-website classic

# TypeScript variant
npx create-docusaurus@latest my-website classic --typescript

# Start dev server
cd my-website
npm start        # → http://localhost:3000
```

**Key project files:**
- `docusaurus.config.js` — site config (title, url, plugins, themes, navbar, footer)
- `sidebars.js` — sidebar structure for the docs section
- `docs/` — Markdown/MDX documentation files
- `blog/` — Blog posts
- `src/pages/` — Custom pages (any `.jsx`/`.mdx` file becomes a route)
- `static/` — Copied as-is to the build output

**Minimal `docusaurus.config.js`:**
```js
export default {
  title: 'My Site',
  url: 'https://my-site.example.com',
  baseUrl: '/',
  presets: [
    ['classic', { docs: { sidebarPath: './sidebars.js' }, blog: false }],
  ],
};
```

## What it gives you

- **Docs** — versioned documentation with MDX, sidebar, prev/next navigation
- **Blog** — markdown-based blog with authors, tags, and RSS feed
- **Pages** — free-form React/MDX pages (landing pages, etc.)
- **Theming** — swizzleable React components, dark mode, custom CSS
- **Plugins** — modular architecture; first-party and community plugins
- **i18n** — built-in localization via CrowdIn or a local workflow
- **Search** — Algolia DocSearch integration or local search plugins
- **Deployment** — static output deployable to any CDN/static host

## Documentation map

| Section | Description | URL |
|---|---|---|
| Introduction | What Docusaurus is and how it's organized | https://docusaurus.io/docs |
| Installation | Scaffold, project structure, running locally | https://docusaurus.io/docs/installation |
| Configuration | `docusaurus.config.js` reference (metadata, plugins, presets) | https://docusaurus.io/docs/configuration |
| Docs feature | Writing docs, sidebars, versioning, frontmatter | https://docusaurus.io/docs/docs-introduction |
| Blog feature | Blog posts, authors, tags, feeds | https://docusaurus.io/docs/blog |
| Pages feature | Custom standalone pages | https://docusaurus.io/docs/creating-pages |
| MDX & React | Using JSX/React components inside Markdown | https://docusaurus.io/docs/markdown-features/react |
| Markdown features | Admonitions, tabs, code blocks, diagrams | https://docusaurus.io/docs/markdown-features |
| Theming | Swizzling, styling, dark mode, navbar/footer config | https://docusaurus.io/docs/styling-layout |
| Theme API reference | Full `themeConfig` options | https://docusaurus.io/docs/api/themes/configuration |
| Plugins | Using, configuring, and writing plugins | https://docusaurus.io/docs/using-plugins |
| Presets | Bundled plugin+theme packages (`preset-classic`) | https://docusaurus.io/docs/using-plugins#using-presets |
| Search | Algolia DocSearch and local search setup | https://docusaurus.io/docs/search |
| i18n | Internationalization workflow and config | https://docusaurus.io/docs/i18n/introduction |
| Versioning | Docs versioning for multiple release branches | https://docusaurus.io/docs/versioning |
| Deployment | Vercel, Netlify, GitHub Pages, CI/CD | https://docusaurus.io/docs/deployment |
| CLI reference | All `docusaurus` CLI commands | https://docusaurus.io/docs/cli |
| `docusaurus.config.js` API | Full config file reference | https://docusaurus.io/docs/api/docusaurus-config |
| Advanced: plugins | Plugin architecture internals | https://docusaurus.io/docs/advanced/plugins |
