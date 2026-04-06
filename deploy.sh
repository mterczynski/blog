#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLOG_REPO="$SCRIPT_DIR"
PAGES_REPO="$(cd "$SCRIPT_DIR/../mterczynski.github.io" && pwd)"

cd "$BLOG_REPO"

if ! command -v hugo >/dev/null 2>&1; then
	echo "Hugo is not installed or not in PATH."
	echo "Install on Windows: winget install Hugo.Hugo.Extended"
	echo "Then restart the terminal and run this script again."
	exit 127
fi

# Ensure theme submodules are present before build.
git submodule update --init --recursive -- themes/PaperMod themes/ananke

# 1. Rebuild with Hugo
rm -rf ./public
hugo

# 2. Update build in ../mterczynski.github.io/hugo-blog
rm -rf "$PAGES_REPO/hugo-blog"
mkdir -p "$PAGES_REPO/hugo-blog"
cp -a ./public/. "$PAGES_REPO/hugo-blog/"

# 3. Commit in ../mterczynski.github.io
cd "$PAGES_REPO"
git add hugo-blog
git commit -m "Update hugo-blog: $(cd "$BLOG_REPO" && git log -1 --pretty=format:"%s")"

# 4. Push in ../mterczynski.github.io
# git push
