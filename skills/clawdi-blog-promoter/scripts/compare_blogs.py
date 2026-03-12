#!/usr/bin/env python3
from pathlib import Path
import argparse, json

def find_target_slug(root: Path, slug: str):
    d = root / slug
    if not d.exists():
        return None
    cands = list(d.glob('*.md')) + list(d.glob('*.mdx')) + list(d.glob('*.markdown'))
    if cands:
        return cands[0]
    idx = d / 'index.md'
    if idx.exists():
        return idx
    return d

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--source-root', required=True, help='e.g. docs/blog/_incoming')
    ap.add_argument('--target-repo', required=True, help='local target repo path')
    ap.add_argument('--target-root', default='apps/web/content/blog')
    ap.add_argument('--json', action='store_true')
    args = ap.parse_args()

    source_root = Path(args.source_root)
    target_root = Path(args.target_repo) / args.target_root

    incoming = sorted([p for p in source_root.glob('*.md') if p.name != '.gitkeep'])
    out = []
    for p in incoming:
      slug = p.stem
      tgt = find_target_slug(target_root, slug)
      status = 'new' if tgt is None else 'exists'
      out.append({'slug': slug, 'source': str(p), 'target': str(tgt) if tgt else None, 'status': status})

    summary = {
      'total_incoming': len(out),
      'new': sum(1 for x in out if x['status']=='new'),
      'exists': sum(1 for x in out if x['status']=='exists'),
      'items': out
    }

    if args.json:
      print(json.dumps(summary, indent=2))
    else:
      print(f"Incoming: {summary['total_incoming']} | New: {summary['new']} | Exists: {summary['exists']}")
      for x in out:
        print(f"[{x['status']}] {x['slug']}")

if __name__ == '__main__':
    main()
