#!/usr/bin/env bash

set -euo pipefail

# 1. Rebuild with Hugo
rm -rf ./public
hugo

# 2. Update build in ../mterczynski.github.io/hugo-blog
rm -rf ../mterczynski.github.io/hugo-blog
mkdir -p ../mterczynski.github.io/hugo-blog
cp -r ./public/* ../mterczynski.github.io/hugo-blog/

# 3. Commit in ../mterczynski.github.io
cd ../mterczynski.github.io
git add hugo-blog
git commit -m "Update hugo-blog: $(cd ../blog && git log -1 --pretty=format:"%s")"

# 4. Push in ../mterczynski.github.io
# git push
