# External Resource Manifest

These are required/optional external resources used by the workflow.

## Production repos
1. `https://github.com/Clawdi-AI/clawdi` (target content repo)
2. `https://github.com/coreyhaines31/marketingskills` (marketing playbooks)
3. `https://github.com/JimLiu/baoyu-skills` (image workflow skills)

## Required OpenClaw skills
- baoyu-cover-image
- baoyu-article-illustrator
- baoyu-image-gen
- copywriting
- skill-creator

## Install strategy
Use `bootstrap/install-resources.sh` to clone repos and install skills into `~/.openclaw/skills`.
