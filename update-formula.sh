#!/usr/bin/env bash
set -euo pipefail

# Update the Homebrew formula version and SHA256 hashes from GitHub release tarballs.
#
# Usage:
#   ./update-formula.sh <VERSION>
#   ./update-formula.sh v0.3.1-beta.2

VERSION="${1:?Usage: ./update-formula.sh <VERSION>}"
FORMULA_VERSION="${VERSION#v}"
BASE_URL="https://github.com/seemsindie/pidgn_cli/releases/download/${VERSION}"
FORMULA="$(cd "$(dirname "$0")" && pwd)/Formula/pidgn.rb"

echo "Updating formula for pidgn-cli ${VERSION}..."
echo ""

# Update version
sed -i '' "s/version \"[^\"]*\"/version \"${FORMULA_VERSION}\"/" "$FORMULA"
echo "  version → ${FORMULA_VERSION}"

for target in aarch64-macos x86_64-macos aarch64-linux x86_64-linux; do
    tarball="pidgn-cli-${VERSION}-${target}.tar.gz"
    url="${BASE_URL}/${tarball}"
    echo -n "  ${target}: "
    sha=$(curl -fsSL "$url" | shasum -a 256 | awk '{print $1}')
    echo "$sha"

    old_sha=$(grep -A1 "${target}" "$FORMULA" | grep sha256 | sed 's/.*"\([a-f0-9]*\)".*/\1/')
    if [ -n "$old_sha" ]; then
        sed -i '' "s/${old_sha}/${sha}/" "$FORMULA"
    fi
done

echo ""
echo "Updated: $FORMULA"
echo "Don't forget to commit and push homebrew-pidgn."
