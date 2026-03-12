---
name: clawdi-seo-blog-ops
description: Run Clawdi/OpenClaw SEO blog operations end-to-end: discover topics, draft or update blog posts, generate consistent dev-tool style covers, add tags/frontmatter, and commit to a writable team repo/branch (without requiring direct write access to Clawdi main repo). Use when asked to create/update Clawdi blog content, generate blog covers, batch image generation for blog posts, or prepare contribution-ready commits/PR branches.
---

# Clawdi SEO Blog Ops

Execute a repeatable pipeline for Clawdi blog production.

## Core Workflow
1. Identify target topics from keyword intent and existing content gaps.
2. Draft/refresh blog content under `docs/blog/`.
3. Apply frontmatter/tags taxonomy.
4. Generate covers using strict brand constraints.
5. Wire covers into markdown.
6. Commit to writable repo/branch and push.

## Non-negotiables
- Keep visual style strict and consistent (see `references/cover-system.md`).
- Use only approved palette for covers.
- Prefer one post at a time for quality control, then batch scale.
- Never commit API keys/secrets.

## Read These References
- `references/workflow.md` (main operating sequence)
- `references/cover-system.md` (exact design constraints)
- `references/tags-taxonomy.md` (frontmatter/tags)
- `references/repo-contrib-model.md` (team contribution model)
- `references/knowledge-map.md` (repos/skills/tooling context)

## Scripts
- `scripts/scaffold_post.sh` — scaffold a new blog markdown with frontmatter
- `scripts/build_cover_batch_json.py` — create Baoyu batch JSON from slugs
- `scripts/insert_cover_refs.py` — inject/update cover image references in posts

Use scripts to reduce manual drift and keep output consistent.
