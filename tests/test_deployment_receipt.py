from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path


MODULE_PATH = Path(__file__).parents[1] / "scripts" / "deployment_receipt.py"
SPEC = importlib.util.spec_from_file_location("deployment_receipt", MODULE_PATH)
assert SPEC and SPEC.loader
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class DeploymentReceiptTests(unittest.TestCase):
    def test_uses_final_cid_in_redirect_chain(self) -> None:
        headers = """HTTP/2 301\nx-ipfs-path: /ipfs/old\n\nHTTP/2 200\nX-IPFS-Path: /ipfs/new/index.html\n"""
        self.assertEqual(MODULE.live_cid(headers), "new")

    def test_missing_cid_returns_none(self) -> None:
        self.assertIsNone(MODULE.live_cid("HTTP/2 200\ncontent-type: text/html\n"))


if __name__ == "__main__":
    unittest.main()
