#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <slug> [--stage incoming|ready]"
  echo "Example: $0 introducing-clawdi --stage incoming"
}

if [[ $# -lt 1 ]]; then usage; exit 1; fi

slug="$1"; shift || true
stage="incoming"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --stage)
      stage="$2"; shift 2;;
    *) echo "Unknown arg: $1"; usage; exit 1;;
  esac
done

if [[ "$stage" != "incoming" && "$stage" != "ready" ]]; then
  echo "--stage must be incoming or ready"
  exit 1
fi

if [[ "$stage" == "incoming" ]]; then
  post="docs/blog/_incoming/${slug}.md"
else
  post="docs/blog/_ready-for-main/${slug}.md"
fi

cover="docs/blog/imgs/${slug}/cover-google.png"

[[ -f "$post" ]] || { echo "Missing post: $post"; exit 1; }
[[ -f "$cover" ]] || { echo "Missing cover: $cover"; exit 1; }

# basic frontmatter checks
head -n 1 "$post" | grep -q '^---$' || { echo "Missing frontmatter start in $post"; exit 1; }
grep -q '^slug:' "$post" || { echo "Missing slug in frontmatter"; exit 1; }
grep -q '^title:' "$post" || { echo "Missing title in frontmatter"; exit 1; }
grep -q '^tags:' "$post" || { echo "Missing tags in frontmatter"; exit 1; }
grep -q '^category:' "$post" || { echo "Missing category in frontmatter"; exit 1; }

# enforce branch naming
branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ ! "$branch" =~ ^feat/blog- ]]; then
  echo "Current branch: $branch"
  echo "Expected branch name prefix: feat/blog-"
  echo "Run: git checkout -b feat/blog-${slug}"
  exit 1
fi

git add "$post" "$cover" "docs/blog/imgs/${slug}" || true
msg="docs(blog): ${stage} ${slug} + cover"
git commit -m "$msg"

echo "Committed successfully: $msg"
