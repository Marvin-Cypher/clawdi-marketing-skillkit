#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="${1:-$HOME/.openclaw/repos}"
SKILLS_DIR="${2:-$HOME/.openclaw/skills}"

mkdir -p "$BASE_DIR" "$SKILLS_DIR"

echo "[1/5] Cloning/Updating repos..."
clone_or_pull () {
  local url="$1"; local dir="$2"
  if [[ -d "$dir/.git" ]]; then
    git -C "$dir" pull --ff-only
  else
    git clone --depth 1 "$url" "$dir"
  fi
}

clone_or_pull "https://github.com/Clawdi-AI/clawdi.git" "$BASE_DIR/clawdi"
clone_or_pull "https://github.com/coreyhaines31/marketingskills.git" "$BASE_DIR/marketingskills"
clone_or_pull "https://github.com/JimLiu/baoyu-skills.git" "$BASE_DIR/baoyu-skills"

echo "[2/5] Installing marketingskills packs..."
if [[ -d "$BASE_DIR/marketingskills/skills" ]]; then
  for d in "$BASE_DIR/marketingskills"/skills/*; do
    [[ -d "$d" ]] || continue
    name="$(basename "$d")"
    rm -rf "$SKILLS_DIR/$name"
    cp -R "$d" "$SKILLS_DIR/$name"
  done
fi

echo "[3/5] Installing Baoyu image skills..."
for name in baoyu-cover-image baoyu-article-illustrator baoyu-image-gen; do
  src="$BASE_DIR/baoyu-skills/skills/$name"
  if [[ -d "$src" ]]; then
    rm -rf "$SKILLS_DIR/$name"
    cp -R "$src" "$SKILLS_DIR/$name"
  else
    echo "Warning: missing $src"
  fi
done

echo "[4/5] Verifying skill presence..."
missing=0
for name in baoyu-cover-image baoyu-article-illustrator baoyu-image-gen; do
  if [[ ! -f "$SKILLS_DIR/$name/SKILL.md" ]]; then
    echo "Missing skill: $name"
    missing=1
  fi
done

for name in copywriting skill-creator; do
  if [[ -f "$SKILLS_DIR/$name/SKILL.md" ]]; then
    echo "Found optional/common skill: $name"
  else
    echo "Note: $name not found in local skills dir (may be built-in in some OpenClaw distributions)."
  fi
done

echo "[5/5] Done"
if [[ "$missing" -eq 1 ]]; then
  echo "Completed with missing required skills. Check logs."
  exit 2
fi

echo "Resources installed successfully."
