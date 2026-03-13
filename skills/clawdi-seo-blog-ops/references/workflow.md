# Workflow

## A) Topic discovery
1. Start from intent clusters:
   - OpenClaw 101
   - How-to/deployment
   - Troubleshooting/rescue
   - Hosted vs self-hosted
   - Persona/use-case pages
   - Weekly roundup
2. Avoid duplicates by checking existing CMS posts:
   `GET https://www.clawdi.ai/cms-api/posts?limit=50&depth=0`
3. Prioritize posts that map directly to conversion intent.

## B) Blog creation/update
1. Draft markdown content locally or in-memory.
2. Keep structure readable:
   - Clear H1
   - Concise intro
   - Section hierarchy
   - Practical examples
   - Direct CTA
3. Keep tone technical-editorial; avoid generic AI fluff.

## C) Frontmatter/tags
1. Ensure each post has tags/category/date/description.
2. Use shared taxonomy file (`tags-taxonomy.md`).

## D) Cover generation
1. Use strict visual rules (see `cover-system.md`).
2. Generate one cover per post.
3. Upload cover to CMS media collection (see `cms-publishing.md`).

## E) Publish to CMS
1. Upload cover image to `POST /cms-api/media` (multipart form).
2. Convert markdown body to Payload Lexical JSON.
3. Upsert post by slug via REST API:
   - Check: `GET /cms-api/posts?where[slug][equals]=<slug>&limit=1`
   - Create: `POST /cms-api/posts` if not found
   - Update: `PATCH /cms-api/posts/:id` if found
4. Set `_status: "published"` and wire cover media ID.
5. Verify: `GET /cms-api/posts?where[slug][equals]=<slug>` after publish.

See `cms-publishing.md` for full API details.
