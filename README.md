# Clawdi Marketing Skillkit

Reusable OpenClaw skill package for Clawdi SEO/blog operations.

## What this repo gives your marketing team
- A reusable skill: `clawdi-seo-blog-ops`
- End-to-end workflow for:
  1) Finding topics
  2) Writing SEO posts
  3) Generating consistent covers (strict dev-tool editorial style)
  4) Publishing directly to the Clawdi Payload CMS via REST API

## Structure
- `skills/clawdi-seo-blog-ops/SKILL.md` — main skill
- `skills/clawdi-seo-blog-ops/references/*` — workflow, cover system, CMS publishing, tags
- `skills/clawdi-seo-blog-ops/scripts/*` — scaffolding and batch tools
- `skills/clawdi-blog-promoter/` — batch publish staged drafts to CMS

## Intended team flow
1. Copy this skill folder into your OpenClaw skills directory.
2. Follow `SKILL.md` + references.
3. Generate API key from `https://www.clawdi.ai/cms/account`.
4. Publish posts directly to the CMS — no Git repo access needed.

## Notes
- This repo includes process knowledge distilled from real Clawdi blog production.
- Keep API keys in local `.env` files or OpenClaw skill config, never in git.

## Quick bootstrap for teammates

To make external repos/skills discoverable on a fresh machine:

```bash
bash bootstrap/install-resources.sh
```

This will clone/update required repos and install the required skills into `~/.openclaw/skills`.

> Publishing goes directly to the Clawdi CMS. No access to `Clawdi-AI/clawdi` is needed.

## Additional skill: CMS blog promotion

`skills/clawdi-blog-promoter` compares incoming blog drafts in this repo against published CMS posts and publishes only new slugs.
