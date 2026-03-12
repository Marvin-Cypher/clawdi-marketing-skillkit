# Path model

## Source (staging repo)
- Blog markdown: `docs/blog/_incoming/<slug>.md`
- Cover image: `docs/blog/imgs/<slug>/cover-google.png`

## Target (Clawdi repo)
Default expected write target:
- `apps/web/content/blog/<slug>/index.md`
- optional image target:
  - `apps/web/content/blog/<slug>/cover-google.png`

If your target repo uses a different layout, pass custom paths to scripts.
