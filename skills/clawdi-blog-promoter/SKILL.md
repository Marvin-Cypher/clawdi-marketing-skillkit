---
name: clawdi-blog-promoter
description: Compare incoming blog drafts in Marvin-Cypher/clawdi-marketing-skillkit against published posts in the Clawdi Payload CMS, and publish only new/updated blogs via the CMS REST API. Use when asked to sync `_incoming` blogs to the CMS, detect missing slugs, or batch-publish staged content.
---

# Clawdi Blog Promoter

Promote blog content from staging intake to the Clawdi Payload CMS safely.

## Target
- **Clawdi Payload CMS** at `https://www.clawdi.ai/cms-api`
- See `../clawdi-seo-blog-ops/references/cms-publishing.md` for full API guide.

## Source/target model
- Source: `docs/blog/_incoming/*.md` (or `_ready-for-cms/`) in this repo
- Target: Clawdi CMS `posts` collection via REST API

## Workflow
1. List existing CMS posts: `GET /cms-api/posts?limit=100&depth=0`
2. Compare source markdown slugs against existing CMS slugs.
3. Report which posts are new vs already published.
4. For new posts: upload cover → convert markdown to Lexical JSON → `POST /cms-api/posts`.
5. For updated posts (with `--allow-update`): `PATCH /cms-api/posts/:id`.

## Safety
- Default behavior publishes only **new slugs** (no overwrite)
- Use `--allow-update` explicitly to update existing slugs
- Always review compare report before publishing
