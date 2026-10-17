#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ -n "$(git status --porcelain)" ]; then
  echo "ERROR: Commit the exact Suteo release before deploying it." >&2
  exit 1
fi

if ! command -v hugo >/dev/null 2>&1; then
  HUGO_BIN=$(find /nix/store -maxdepth 3 -name hugo -type f 2>/dev/null | head -1)
  if [ -z "$HUGO_BIN" ]; then
    echo "ERROR: hugo not found on PATH or in /nix/store." >&2
    exit 1
  fi
  export PATH="$(dirname "$HUGO_BIN"):$PATH"
fi

rm -rf public
hugo --cleanDestinationDir --minify --panicOnWarning
python3 scripts/check_site_links.py public /

# Verify the public route through fresh public DNS. The laptop's private DNS
# path may retain an old hosting answer after an intentional domain cutover.
PUBLIC_CURL=(curl --http1.1 --doh-url https://cloudflare-dns.com/dns-query)
CONFIG="$(dirname "$0")/.hostingConfig.json"
if [ ! -f "$CONFIG" ]; then
  echo "ERROR: missing private 4EVERLAND configuration." >&2
  exit 1
fi
TOKEN=$(python3 -c "import json;print(json.load(open('$CONFIG'))['token'])")
PROJECT_ID=$(python3 -c "import json;print(json.load(open('$CONFIG'))['projectId'])")

ZIP=$(mktemp /tmp/suteo-deploy.XXXXXX.zip)
RESP=$(mktemp)
HDRS=$(mktemp)
LIVE_HDRS=$(mktemp)
trap 'rm -f "$ZIP" "$RESP" "$HDRS" "$LIVE_HDRS"' EXIT
rm -f "$ZIP"
python3 - "$ZIP" public <<'PY'
import os
import sys
import zipfile

zippath, root = sys.argv[1], sys.argv[2]
with zipfile.ZipFile(zippath, "w", zipfile.ZIP_DEFLATED) as archive:
    for directory, _, filenames in os.walk(root):
        for filename in filenames:
            if filename == ".DS_Store":
                continue
            full = os.path.join(directory, filename)
            archive.write(full, os.path.relpath(full, root))
PY

echo "Deploying the committed Suteo release to 4EVERLAND."
ATTEMPTS=5
DELAY=4
for attempt in $(seq 1 "$ATTEMPTS"); do
  CODE=$(curl --http1.1 --max-time 180 -sS \
    -D "$HDRS" -o "$RESP" -w '%{http_code}' \
    -X POST 'https://hosting.api.4everland.org/deploy' \
    -H "token: $TOKEN" \
    -H 'Accept-Version: 1.0' \
    -F "file=@$ZIP" \
    -F "projectId=$PROJECT_ID") && CURL_OK=1 || CURL_OK=0

  if [ "$CURL_OK" = 1 ] && [ "$CODE" = 200 ]; then
    CID=$(python3 -c "import json
try:
    result=json.load(open('$RESP'))
    print(result['content']['fileHash'] if result.get('code') == 200 else '')
except Exception:
    print('')")
    if [ -n "$CID" ]; then
      LIVE_OK=0
      for live_attempt in $(seq 1 12); do
        if "${PUBLIC_CURL[@]}" -fsSIL --max-time 20 'https://suteo.dev/' > "$LIVE_HDRS" \
          && python3 scripts/deployment_receipt.py "$LIVE_HDRS" "$CID"; then
          LIVE_OK=1
          break
        fi
        if [ "$live_attempt" -lt 12 ]; then
          echo "Upload accepted; waiting for suteo.dev to serve the new release ($live_attempt/12)."
          sleep 5
        fi
      done
      if [ "$LIVE_OK" != 1 ]; then
        LIVE_CID=$(python3 scripts/deployment_receipt.py "$LIVE_HDRS" 2>/dev/null || true)
        echo "ERROR: upload succeeded, but suteo.dev still serves ${LIVE_CID:-a different or unknown release}." >&2
        exit 1
      fi

      for route in \
        / \
        /posts/building-in-the-dark/ \
        /posts/the-model-problem-nobody-warned-me-about/ \
        /posts/the-timmis-protocol/
      do
        "${PUBLIC_CURL[@]}" -fsS --max-time 20 "https://suteo.dev$route" -o /dev/null
      done
      if "${PUBLIC_CURL[@]}" -fsS --max-time 20 \
        'https://suteo.dev/posts/a-studio-with-no-meetings/' -o /dev/null; then
        echo "ERROR: the held essay is publicly reachable." >&2
        exit 1
      fi
      echo "Suteo is live on 4EVERLAND and the held essay remains private. CID: $CID"
      exit 0
    fi
  fi

  echo "Attempt $attempt/$ATTEMPTS failed (curl_ok=$CURL_OK http=${CODE:-none})." >&2
  if [ "$attempt" -lt "$ATTEMPTS" ]; then
    sleep "$DELAY"
    DELAY=$((DELAY * 2))
  fi
done

echo "Deploy failed after $ATTEMPTS attempts." >&2
exit 1
