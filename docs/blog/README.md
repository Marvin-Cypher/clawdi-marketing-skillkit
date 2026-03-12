# Blog Content Collection (Team Intake)

This repo section is the **collection hub** for marketing team blog contributions before promoting to `Clawdi-AI/clawdi` main.

## Structure
- `docs/blog/_incoming/` — draft submissions (new/updated posts)
- `docs/blog/_ready-for-main/` — reviewed and approved content ready to re-commit to main repo
- `docs/blog/imgs/<slug>/` — cover + illustrations for each post
- `docs/blog/_published-index/manifest.md` — tracking list for promoted posts

## Team flow
1. Create/update post markdown in `_incoming/`.
2. Generate cover in `imgs/<slug>/cover-google.png`.
3. Open PR in this repo.
4. Reviewer moves approved content to `_ready-for-main/`.
5. Maintainer cherry-picks/re-commits to `Clawdi-AI/clawdi`.

## Filename convention
- Post file: `<slug>.md`
- Image directory: `imgs/<slug>/`
- Cover: `cover-google.png`

## Required frontmatter
```yaml
---
title: "..."
slug: "..."
tags: [openclaw, clawdi]
category: how-to
description: "..."
status: incoming | ready-for-main
source_repo: Marvin-Cypher/clawdi-marketing-skillkit
---
```
