# Usage

## Compare only
```bash
python3 skills/clawdi-blog-promoter/scripts/compare_blogs.py \
  --source-root docs/blog/_incoming \
  --target-repo /path/to/clawdi \
  --target-root apps/web/content/blog
```

## Promote new slugs and push
```bash
bash skills/clawdi-blog-promoter/scripts/promote_new_blogs.sh \
  --source-repo /path/to/clawdi-marketing-skillkit \
  --target-repo-url https://github.com/Clawdi-AI/clawdi.git \
  --target-root apps/web/content/blog \
  --branch feat/promote-incoming-blogs
```

Notes:
- Requires push auth to target repo.
- Uses only new slugs by default.
