# Workflow

## A) Topic discovery
1. Start from intent clusters:
   - OpenClaw 101
   - How-to/deployment
   - troubleshooting/rescue
   - hosted vs self-hosted
   - persona/use-case pages
   - weekly roundup
2. Avoid duplicates by scanning `docs/blog/*.md` titles/slugs.
3. Prioritize posts that map directly to conversion intent.

## B) Blog creation/update
1. Create or update markdown under `docs/blog/<slug>.md`.
2. Keep structure readable:
   - clear H1
   - concise intro
   - section hierarchy
   - practical examples
   - direct CTA
3. Keep tone technical-editorial; avoid generic AI fluff.

## C) Frontmatter/tags
1. Ensure each post has tags/category/date/description as required by site.
2. Use shared taxonomy file.

## D) Cover generation
1. Use strict visual rules (see `cover-system.md`).
2. Generate one cover per post:
   - `docs/blog/imgs/<slug>/cover-google.png`
3. Insert image reference near top of post.

## E) Commit model
1. If no access to main repo, commit to team-owned repo/branch.
2. Keep commits scoped and reviewable:
   - content
   - covers
   - metadata
3. Push and open PR if needed.
