#!/bin/bash
echo "Stripping x86_64 from lxml etree..."
VENV_PATH=$(poetry env info -p)
LXML_ETREE="$VENV_PATH/lib/python3.12/site-packages/lxml/etree.cpython-312-darwin.so"

cp "$LXML_ETREE" "$LXML_ETREE.bak"
lipo -remove x86_64 -output "$LXML_ETREE.arm64" "$LXML_ETREE"
mv "$LXML_ETREE.arm64" "$LXML_ETREE"
echo "✅ Done: etree is now arm64-only"