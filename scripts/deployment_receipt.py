#!/usr/bin/env python3
"""Read a 4EVERLAND response header dump and verify its live IPFS CID."""

from __future__ import annotations

import re
import sys
from pathlib import Path


IPFS_PATH = re.compile(r"^x-ipfs-path:\s*/ipfs/([^/\s]+)", re.IGNORECASE | re.MULTILINE)


def live_cid(headers: str) -> str | None:
    """Return the CID from the final x-ipfs-path header in a redirect chain."""
    matches = IPFS_PATH.findall(headers)
    return matches[-1] if matches else None


def main(argv: list[str] | None = None) -> int:
    args = list(sys.argv[1:] if argv is None else argv)
    if not 1 <= len(args) <= 2:
        print("Usage: deployment_receipt.py HEADERS [EXPECTED_CID]", file=sys.stderr)
        return 2

    cid = live_cid(Path(args[0]).read_text(encoding="utf-8", errors="replace"))
    if len(args) == 1:
        if cid:
            print(cid)
            return 0
        return 1
    return 0 if cid == args[1] else 1


if __name__ == "__main__":
    raise SystemExit(main())
