#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage:
  $0 --source-repo <path> --target-repo-url <url> [--target-root apps/web/content/blog] [--branch feat/promote-incoming-blogs] [--allow-update]
EOF
}

SOURCE_REPO=""
TARGET_REPO_URL=""
TARGET_ROOT="apps/web/content/blog"
BRANCH="feat/promote-incoming-blogs"
ALLOW_UPDATE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --source-repo) SOURCE_REPO="$2"; shift 2;;
    --target-repo-url) TARGET_REPO_URL="$2"; shift 2;;
    --target-root) TARGET_ROOT="$2"; shift 2;;
    --branch) BRANCH="$2"; shift 2;;
    --allow-update) ALLOW_UPDATE=1; shift 1;;
    *) echo "Unknown arg: $1"; usage; exit 1;;
  esac
done

[[ -n "$SOURCE_REPO" && -n "$TARGET_REPO_URL" ]] || { usage; exit 1; }

TMP=/tmp/clawdi-promote-target
rm -rf "$TMP"
git clone "$TARGET_REPO_URL" "$TMP"
cd "$TMP"
git checkout -b "$BRANCH"

SRC_INCOMING="$SOURCE_REPO/docs/blog/_incoming"
SRC_IMGS="$SOURCE_REPO/docs/blog/imgs"

mkdir -p "$TARGET_ROOT"

count_new=0
count_upd=0
for f in "$SRC_INCOMING"/*.md; do
  [[ -f "$f" ]] || continue
  base=$(basename "$f")
  [[ "$base" == ".gitkeep" ]] && continue
  slug="${base%.md}"
  dest_dir="$TARGET_ROOT/$slug"
  dest_file="$dest_dir/index.md"

  existed_before=0
  [[ -f "$dest_file" ]] && existed_before=1

  if [[ "$existed_before" -eq 1 && "$ALLOW_UPDATE" -ne 1 ]]; then
    echo "skip existing: $slug"
    continue
  fi

  mkdir -p "$dest_dir"
  cp "$f" "$dest_file"

  if [[ -f "$SRC_IMGS/$slug/cover-google.png" ]]; then
    cp "$SRC_IMGS/$slug/cover-google.png" "$dest_dir/cover-google.png"
  fi

  if [[ "$existed_before" -eq 1 ]]; then
    count_upd=$((count_upd+1))
  else
    count_new=$((count_new+1))
  fi

  echo "promoted: $slug"
done

git add "$TARGET_ROOT" || true
if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "docs(blog): promote incoming blogs from staging repo"
git push -u origin "$BRANCH"

echo "Done. New: $count_new | Updated: $count_upd | Branch: $BRANCH"
