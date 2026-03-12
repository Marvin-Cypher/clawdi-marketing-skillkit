#!/usr/bin/env python3
from pathlib import Path
import re, sys

if len(sys.argv) < 2:
    print("Usage: insert_cover_refs.py <slug1> <slug2> ...")
    sys.exit(1)

for slug in sys.argv[1:]:
    p = Path(f"docs/blog/{slug}.md")
    if not p.exists():
        print(f"skip missing {p}")
        continue
    s = p.read_text()
    img = f"![{slug} cover](./imgs/{slug}/cover-google.png)"
    patt = re.compile(rf"!\[[^\]]*\]\(\./imgs/{re.escape(slug)}/cover[^)]*\)")
    if patt.search(s):
        s = patt.sub(img, s, count=1)
    else:
        lines = s.splitlines()
        insert_at = 1 if lines and lines[0].startswith('# ') else 0
        lines = lines[:insert_at+1] + ["", img, ""] + lines[insert_at+1:]
        s = "\n".join(lines) + "\n"
    p.write_text(s)
    print(f"updated {slug}")
