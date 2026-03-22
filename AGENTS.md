<!-- AGENTS.md -->
# AGENTS

## Project Goal

Build and maintain a clean, static-first Astro site for the SKOGARD volunteer network. The tone should stay grounded, simple, serious, and action-oriented.

Core line: **Show up. Listen. Act.**

## Working Style

- Prefer secure, maintainable, accessible code
- Preserve compatibility with local development and future Cloudflare Pages deployment
- Use `SKŌGARD` in visible public-facing brand text; use ASCII `SKOGARD` only for technical identifiers, file names, repo names, domains, config keys, and other machine-safe references unless there is a specific reason otherwise
- Use existing patterns before inventing new ones
- Keep the file structure understandable
- Prefer small, clean, reversible changes
- Avoid unnecessary dependencies and unnecessary abstractions

## Agent Guidance

- Agents may make sensible low-risk improvements without waiting for constant approval
- Agents should propose practical improvements when they clearly help maintainability, accessibility, performance, or security
- Agents should clearly flag high-impact changes, especially anything that changes architecture, deployment behavior, or the security model
- Agents should keep the site easy for humans to read and extend
- Agents should prefer Astro pages, components, and simple CSS unless a stronger reason exists
- Agents should include exact file paths in change notes
- Agents should close any local testing or dev ports they open once testing is complete, unless the user explicitly asks to keep a server running

## Guardrails

- Keep the initial site static unless a real feature requires more
- Preserve semantic HTML and accessible navigation patterns
- Do not add frameworks or tooling unless there is a clear need
- Do not break local development to optimize prematurely for deployment
- Do not replace established patterns with larger systems without a concrete benefit
