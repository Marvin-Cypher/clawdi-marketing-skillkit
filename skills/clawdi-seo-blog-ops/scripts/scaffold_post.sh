#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <slug> <title>"
  exit 1
fi

slug="$1"
shift
title="$*"
out="docs/blog/${slug}.md"
mkdir -p "docs/blog"

if [[ -f "$out" ]]; then
  echo "Exists: $out"
  exit 1
fi

cat > "$out" <<EOF
---
title: "$title"
slug: "$slug"
tags: [openclaw, clawdi]
category: how-to
description: "TODO"
---

# $title

![${slug} cover](./imgs/${slug}/cover-google.png)

TODO
EOF

echo "Created $out"
