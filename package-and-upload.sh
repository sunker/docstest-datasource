#!/bin/bash
set -euo pipefail

PLUGIN_ID="eriktest-docstest-datasource"
ARCHIVES_DIR="/Users/erik/code/grafana/plugin-uploader/archives"

# 1. Bump patch version
npm version patch --no-git-tag-version
VERSION=$(node -p "require('./package.json').version")
echo "Bumped version to $VERSION"

# 2. Build
npm run build

# 3. Clear archives
rm -f "$ARCHIVES_DIR"/*.zip "$ARCHIVES_DIR"/*.sha1

# 4. Create ZIP with wrapper directory (as GCOM expects)
#    dist/ contains flat files, so symlink to create the wrapper
TMPDIR=$(mktemp -d)
ln -s "$(pwd)/dist" "$TMPDIR/${PLUGIN_ID}"
cd "$TMPDIR"
zip -r "$ARCHIVES_DIR/${PLUGIN_ID}-${VERSION}.zip" "${PLUGIN_ID}/"
rm -rf "$TMPDIR"

echo "Archive created: $ARCHIVES_DIR/${PLUGIN_ID}-${VERSION}.zip"
