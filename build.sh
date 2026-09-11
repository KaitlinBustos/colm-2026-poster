#!/bin/bash
# Build poster PDF from HTML using Chrome headless
# Usage: ./build.sh

set -e

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ ! -f "$CHROME" ]; then
  echo "Error: Google Chrome not found at $CHROME"
  echo "Install Chrome or update the path in this script."
  exit 1
fi

echo "Building poster.pdf from poster.html..."
"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf="$(pwd)/poster.pdf" \
  "file://$(pwd)/poster.html" 2>/dev/null

echo "Done: poster.pdf ($(du -h poster.pdf | cut -f1))"
