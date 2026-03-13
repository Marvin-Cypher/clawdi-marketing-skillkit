# External Resource Manifest

These are required/optional external resources used by the workflow.

## Publishing target
- **Clawdi Payload CMS**: `https://www.clawdi.ai/cms-api` (REST API, source of truth for blog)

## Reference repos
1. `https://github.com/coreyhaines31/marketingskills` (marketing playbooks)
2. `https://github.com/JimLiu/baoyu-skills` (image workflow skills)
3. `https://github.com/Clawdi-AI/clawdi` (CMS config reference; not needed for publishing)

## Required OpenClaw skills
- payload-rest-import (CMS publishing — on CVM)
- baoyu-cover-image
- baoyu-article-illustrator
- baoyu-image-gen
- copywriting
- skill-creator

## Install strategy
Use `bootstrap/install-resources.sh` to clone repos and install skills into `~/.openclaw/skills`.
