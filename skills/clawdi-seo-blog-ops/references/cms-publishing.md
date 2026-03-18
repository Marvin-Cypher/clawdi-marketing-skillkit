# CMS Publishing Guide

Posts are published directly to the Clawdi Payload CMS via REST API. GitHub-based blog publishing is deprecated.

## Target CMS

- Base API: `https://www.clawdi.ai/cms-api`
- Admin panel: `https://www.clawdi.ai/cms`
- API key management: `https://www.clawdi.ai/cms/account`

## Authentication

```http
Authorization: users API-Key <YOUR_API_KEY>
```

Generate your API key from the admin account page. Do not commit API keys to this repo.

For OpenClaw CVM agents: the key is stored in `/data/openclaw/knowledge/clawdi/.env` as `PAYLOAD_CMS_API_KEY` and baked into the `payload-rest-import` skill on the CVM.

## Collections

### `posts`

| Field | Type | Notes |
|-------|------|-------|
| `title` | text | Required |
| `slug` | text | Required, unique, auto-generated from title if blank |
| `summary` | textarea | Required |
| `publishedAt` | date | Auto-set on first publish if empty |
| `cover` | upload (media) | Media ID |
| `tags` | array | `[{ "value": "openclaw" }, { "value": "how-to" }]` |
| `content` | richText | Payload Lexical JSON (not raw markdown) |
| `meta.title` | text | SEO title |
| `meta.description` | text | SEO description |
| `meta.image` | upload (media) | OG image media ID |
| `_status` | text | `"published"` or `"draft"` |

### `media`

Upload via multipart form data. `alt` is required.

## Media Upload

```http
POST https://www.clawdi.ai/cms-api/media
Content-Type: multipart/form-data
Authorization: users API-Key <KEY>
```

Fields:
- `file` — the image file
- `_payload` — JSON string: `{"alt":"Article cover"}`

Response includes the media `id` to use in post `cover` and `meta.image` fields.

## Post Upsert Pattern

### 1. Check if post exists
```http
GET https://www.clawdi.ai/cms-api/posts?where[slug][equals]=my-slug&limit=1
```

### 2. Create or update
- `POST /cms-api/posts` if not found
- `PATCH /cms-api/posts/:id` if found

When updating an existing post, prefer **PATCHing only the fields you are changing** to avoid accidentally resetting other fields. Example:

- First PATCH: `{ "content": { ...Lexical JSON... } }`.
- Later PATCH: `{ "cover": <mediaId>, "meta": { "image": <mediaId> } }`.

### 3. Payload shape (new post)
```json
{
  "title": "My Article",
  "slug": "my-article",
  "summary": "Short summary",
  "publishedAt": "2026-03-10T00:00:00.000Z",
  "cover": 123,
  "tags": [{ "value": "openclaw" }, { "value": "how-to" }],
  "content": { "root": { "children": [], "direction": null, "format": "", "indent": 0, "type": "root", "version": 1 } },
  "meta": {
    "title": "SEO Title",
    "description": "SEO description",
    "image": 123
  },
  "_status": "published"
}
```

## Rich Text (Lexical JSON)

Payload uses Lexical as the rich text editor. Content must be converted from markdown to Lexical JSON before upload.

### Minimal markdown → Lexical mapping

For simple Clawdi blog posts (no tables/code blocks), a safe mapping is:

- `#`, `##`, `###` → `heading` nodes with `tag: "h1" | "h2" | "h3"`.
- `- ...` bullet items → a `list` node with:
  - `type: "list"`
  - `listType: "bullet"`
  - `tag: "ul"`
  - `children`: `listitem` nodes, each wrapping a single `text` child.
- `1. ...` numbered items → a `list` node with:
  - `type: "list"`
  - `listType: "number"`
  - `tag: "ol"`
  - `children`: `listitem` nodes.
- `---` → `horizontalrule` node.
- Everything else → `paragraph` nodes.

You can build `content.root.children` programmatically from the markdown body, then PATCH only the `content` field on an existing `posts/:id`.

### Lists and required `tag`

Payload's Lexical RichText renderer uses the `tag` field on list nodes to decide which HTML element to render (`<ul>` vs `<ol>`). List nodes **must** include this field:

- Unordered (bullet) lists → `listType: "bullet"`, `tag: "ul"`.
- Ordered (numbered) lists → `listType: "number"`, `tag: "ol"`.

If `tag` is missing, the frontend may attempt to render an undefined element and crash (React error #130). When debugging broken posts, inspect the Lexical JSON and ensure list nodes have both `listType` and `tag`.

### Supported conversions
- Headings, paragraphs, lists, blockquotes, horizontal rules, links
- Inline images → upload to `media` → Lexical `upload` nodes
- Markdown tables → Lexical `table` nodes
- Fenced code blocks → Lexical block/code nodes

### Known gaps
- Raw HTML blocks, MDX/JSX, Mermaid diagrams, footnotes — inspect output after import.

## Validation Checklist

After publishing, verify:
- Post exists: `GET /cms-api/posts?where[slug][equals]=<slug>`
- `_status` is `"published"`
- `cover` is a real media relation (not null)
- `meta.title`, `meta.description`, `meta.image` are populated
- Media URLs point to `https://assets.clawdi.ai/` (not local paths)
- Inline images are Lexical `upload` nodes (not markdown text)
- Tables are Lexical `table` nodes (not pipe-delimited text)
- Code blocks are proper code/block nodes (not raw triple-backtick text)
- List nodes include both `listType` and `tag` (`"ul"`/`"ol"`) so the frontend renderer can safely render `<ul>`/`<ol>` elements.

## Blog ordering

Blog order is controlled by `publishedAt` descending. When migrating content, preserve the old visible order by assigning stable `publishedAt` values.
