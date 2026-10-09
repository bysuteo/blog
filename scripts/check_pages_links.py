#!/usr/bin/env python3
"""Fail when a generated project site links outside its Pages base path."""

from __future__ import annotations

import argparse
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlsplit


class LinkParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.links: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        for name, value in attrs:
            if name in {"href", "src"} and value:
                self.links.append(value)


def target_exists(root: Path, relative_path: str) -> bool:
    target = root / relative_path
    return target.is_file() or (target / "index.html").is_file()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("public_dir", type=Path)
    parser.add_argument("base_path")
    args = parser.parse_args()

    root = args.public_dir.resolve()
    stripped = args.base_path.strip("/")
    base = f"/{stripped}/" if stripped else "/"
    failures: list[str] = []

    for page in root.rglob("*.html"):
        parsed = LinkParser()
        parsed.feed(page.read_text(encoding="utf-8", errors="replace"))
        source = page.relative_to(root)
        for raw_link in parsed.links:
            split = urlsplit(raw_link)
            if split.scheme or split.netloc:
                continue
            path = split.path
            if not path.startswith("/"):
                continue
            if base != "/" and path == base.rstrip("/"):
                path = base
            if not path.startswith(base):
                failures.append(f"{source}: escapes {base}: {raw_link}")
                continue
            if not target_exists(root, path[len(base) :]):
                failures.append(f"{source}: missing target: {raw_link}")

    if failures:
        print("Broken GitHub Pages links:")
        print("\n".join(failures))
        return 1

    print(f"GitHub Pages links stay under {base} and resolve locally.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
