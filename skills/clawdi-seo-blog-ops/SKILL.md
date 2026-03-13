---
name: clawdi-seo-blog-ops
description: Run Clawdi/OpenClaw SEO blog operations end-to-end: discover topics, draft or update blog posts, generate consistent dev-tool style covers, add tags/frontmatter, and publish directly to the Clawdi Payload CMS via REST API. Use when asked to create/update Clawdi blog content, generate blog covers, batch image generation for blog posts, or publish posts to the CMS.
---

# Clawdi SEO Blog Ops

Execute a repeatable pipeline for Clawdi blog production. Publishing goes to the Clawdi Payload CMS via REST API.

## Core Workflow
1. Identify target topics from keyword intent and existing content gaps.
2. Draft/refresh blog content as markdown.
3. Apply frontmatter/tags taxonomy.
4. Generate covers using strict brand constraints.
5. Upload cover to CMS media collection.
6. Convert markdown to Lexical JSON and publish post to CMS.
7. Verify published post via API.

## Non-negotiables
- Keep visual style strict and consistent (see `references/cover-system.md`).
- Use only approved palette for covers.
- Prefer one post at a time for quality control, then batch scale.
- Never include API keys/secrets in published content.
- Always verify published post after publishing.

## Read These References
- `references/workflow.md` (main operating sequence)
- `references/cover-system.md` (exact design constraints)
- `references/tags-taxonomy.md` (frontmatter/tags)
- `references/cms-publishing.md` (CMS API publishing guide)
- `references/knowledge-map.md` (repos/skills/tooling context)

## Scripts
- `scripts/scaffold_post.sh` — scaffold a new blog markdown with frontmatter
- `scripts/build_cover_batch_json.py` — create Baoyu batch JSON from slugs
- `scripts/insert_cover_refs.py` — inject/update cover image references in posts

Use scripts to reduce manual drift and keep output consistent.
