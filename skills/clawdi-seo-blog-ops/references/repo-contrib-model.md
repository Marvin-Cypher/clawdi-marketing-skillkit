# Contribution Model

## Publishing

Blog content is published directly to the **Clawdi Payload CMS** via REST API.

Contributors do not need access to `Clawdi-AI/clawdi` or any Git repo to publish blog posts. The CMS is the source of truth for published content.

See `cms-publishing.md` for the full API guide.

## This repo's role

This repo (`clawdi-marketing-skillkit`) stores:
- Reusable skills and workflow references for blog production
- Cover system design constraints
- Scripts for scaffolding and batch operations
- Drafts in progress (optional, for review before CMS publish)

## Draft staging (optional)

For teams that want draft review before publishing to CMS:
- Draft intake: `docs/blog/_incoming/`
- Ready for CMS publish: `docs/blog/_ready-for-cms/`
- Images: `docs/blog/imgs/<slug>/`

## Branch strategy (for skill/reference updates)
- `feat/blog-<slug>` — draft content for review
- `feat/workflow-<topic>` — skill or reference updates
