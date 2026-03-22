<!-- README.md -->
# SKOGARD

Static-first Astro starter for the SKOGARD volunteer network at `skogard.org`.

## Purpose

This project provides a clean public-facing foundation for a volunteer network site. The initial version is intentionally small, fast, readable, and easy to extend into a broader organizing platform over time.

Core line: **Show up. Listen. Act.**

## Stack Summary

- Astro for static-first site generation
- Plain CSS in a single global stylesheet
- Semantic HTML with reusable Astro components
- Git for local history and GitHub backup
- Future-ready for Cloudflare Pages static deployment

## Local Development

Install dependencies:

```bash
npm install
```

Start the local dev server:

```bash
npm run dev
```

Build the site:

```bash
npm run build
```

Preview the production build locally:

```bash
npm run preview
```

## Project Structure

- `src/layouts/` shared page layout
- `src/components/` reusable UI pieces
- `src/pages/` route-based Astro pages
- `src/styles/site.css` global site styles
- `public/` static assets for future use

## Cloudflare Pages Notes

This scaffold is static and does not require a Cloudflare adapter. For a future Cloudflare Pages deployment:

- Build command: `npm run build`
- Output directory: `dist`
- Node version: use a current supported LTS release

If server-rendered features are introduced later, Cloudflare support can be expanded at that time with an adapter and a clear deployment decision.

## GitHub Notes

Use GitHub for backup, collaboration, and version history.

- Initialize the local git repo if needed
- Commit small, understandable changes
- Add the remote only after the GitHub repository exists
- Push the default branch after the remote is configured

## Extending Safely

- Reuse the existing layout and component patterns before adding new structure
- Keep the site static unless a real feature needs interactivity or server logic
- Prefer small, reversible changes over broad rewrites
- Preserve accessible HTML, readable contrast, and keyboard-friendly navigation
- Avoid adding dependencies unless they clearly reduce complexity or maintenance risk
