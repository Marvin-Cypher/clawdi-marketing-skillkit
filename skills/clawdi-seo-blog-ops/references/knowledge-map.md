# Knowledge Map (Repos / Skills / Tooling)

## Publishing target
- **Clawdi Payload CMS** at `https://www.clawdi.ai/cms-api` (REST API, source of truth for blog)

## Repos
- `Marvin-Cypher/clawdi-marketing-skillkit` (this repo — skills, references, scripts)
- `Clawdi-AI/clawdi` (main product repo — CMS config, frontend)
- `coreyhaines31/marketingskills` (marketing playbooks)
- `JimLiu/baoyu-skills` (image workflow skills)

## Key skills
- `payload-rest-import` — CMS API publishing workflow (on OpenClaw CVM)
- `clawdi-seo-blog-ops` — this skill (end-to-end blog production)
- `baoyu-cover-image`
- `baoyu-article-illustrator`
- `baoyu-image-gen`
- `copywriting`
- `skill-creator`

## Proven practical flow
- Draft post → strict cover prompt → generate cover → upload cover to CMS → convert markdown to Lexical JSON → publish to CMS → verify
- Validate outputs in CMS admin panel before broad batch publishing

## Make resources available on teammate machines
Run:

```bash
bash bootstrap/install-resources.sh
```

from this repo root after clone.
