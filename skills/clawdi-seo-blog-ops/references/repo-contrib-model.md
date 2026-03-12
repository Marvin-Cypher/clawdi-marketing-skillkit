# Repo Contribution Model (Team Without Main Access)

## Principle
Contributors should not need direct write access to `Clawdi-AI/clawdi`.

## Recommended pattern
1. Team clones writable repo (e.g., Marvin-owned marketing repo).
2. Team commits blog/covers there.
3. Open PR or cherry-pick into main repo by authorized maintainer.

## Branch strategy
- `feat/blog-<slug>`
- `feat/covers-batch-<date>`

## Commit strategy
- one commit per post or tightly scoped batch
- clear message: `docs(blog): add/update <slug> + cover`
