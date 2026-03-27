#!/usr/bin/env bash
set -euo pipefail

# Update the Homebrew formula SHA256 hashes from GitHub release tarballs.
#
# Usage:
#   ./update-formula.sh [VERSION]
#   ./update-formula.sh v0.1.0
#
# If VERSION is omitted, defaults to v0.1.0.

VERSION="${1:-v0.1.0}"
BASE_URL="https://github.com/seemsindie/pidgn_cli/releases/download/${VERSION}"
TARGETS=("aarch64-macos" "x86_64-macos" "aarch64-linux" "x86_64-linux")

echo "Fetching SHA256 hashes for pidgn-cli ${VERSION}..."
echo ""

for target in "${TARGETS[@]}"; do
    tarball="pidgn-cli-${VERSION}-${target}.tar.gz"
    url="${BASE_URL}/${tarball}"
    echo -n "  ${target}: "
    sha=$(curl -fsSL "$url" | shasum -a 256 | awk '{print $1}')
    echo "$sha"
done

echo ""
echo "Paste these values into Formula/pidgn.rb, replacing the PLACEHOLDER_* strings."
echo "Also update the 'version' field if needed."
