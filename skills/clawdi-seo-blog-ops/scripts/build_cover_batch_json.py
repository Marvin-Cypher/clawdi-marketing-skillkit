#!/usr/bin/env python3
import json, sys

if len(sys.argv) < 2:
    print("Usage: build_cover_batch_json.py <slug1> <slug2> ...")
    sys.exit(1)

slugs = sys.argv[1:]
tasks = []
for s in slugs:
    tasks.append({
        "id": f"{s}-cover",
        "promptFiles": [f"../imgs/{s}/prompts/cover-google-strict.md"],
        "image": f"../imgs/{s}/cover-google.png",
        "provider": "google",
        "model": "gemini-3.1-flash-image-preview",
        "ar": "16:9",
        "quality": "2k"
    })

print(json.dumps({"jobs": 2, "tasks": tasks}, indent=2))
