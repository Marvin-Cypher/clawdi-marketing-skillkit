# Clawdi Marketing Skillkit

Reusable OpenClaw skill package for Clawdi SEO/blog operations.

## What this repo gives your marketing team
- A reusable skill: `clawdi-seo-blog-ops`
- End-to-end workflow for:
  1) finding topics
  2) writing SEO posts
  3) generating consistent covers (Google image model / Baoyu flow)
  4) committing to a team-owned repo when main repo access is restricted

## Structure
- `skills/clawdi-seo-blog-ops/SKILL.md`
- `skills/clawdi-seo-blog-ops/references/*`
- `skills/clawdi-seo-blog-ops/scripts/*`

## Intended team flow
1. Clone target content repo (or fork) locally.
2. Copy this skill folder into OpenClaw skills directory.
3. Follow `SKILL.md` + references.
4. Commit to your team repo (or branch + PR), not `Clawdi-AI/clawdi` directly.

## Notes
- This repo includes process knowledge distilled from real Clawdi blog production.
- Keep secrets in local `.env` files, never in git.


## Quick bootstrap for teammates

To make external repos/skills discoverable on a fresh machine:

```bash
bash bootstrap/install-resources.sh
```

This will clone/update required repos and install the required skills into `~/.openclaw/skills`.


> Team workflow in this repo does **not require** access to `Clawdi-AI/clawdi`.
> Teams contribute here; maintainers promote approved content to main.
