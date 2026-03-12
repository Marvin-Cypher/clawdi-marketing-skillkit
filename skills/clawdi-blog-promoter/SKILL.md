---
name: clawdi-blog-promoter
description: Compare incoming blog drafts in Marvin-Cypher/clawdi-marketing-skillkit against target Clawdi blog content path, promote only new blogs, and commit/push to target repo when authorized. Use when asked to sync `_incoming` blogs to `apps/web/content/blog` (or another target path), detect missing slugs, or automate cross-repo promotion.
---

# Clawdi Blog Promoter

Promote blog content from staging intake to target repo safely.

## Read first
- `references/path-model.md`
- `references/usage.md`

## Scripts
- `scripts/compare_blogs.py` — report missing/existing slugs
- `scripts/promote_new_blogs.sh` — clone target repo, copy new slugs, commit, push

## Default source/target model
- Source: `docs/blog/_incoming/*.md` in staging repo
- Target: `apps/web/content/blog/<slug>/index.md` in target repo

Override paths via flags if needed.

## Safety
- Default behavior promotes only **new slugs** (no overwrite)
- Use `--allow-update` explicitly to update existing slugs
- Always review compare report before promotion
