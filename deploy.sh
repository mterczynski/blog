#!/usr/bin/env sh
set -eu

npm ci
npm run build

# Required:
# DEPLOY_BRANCH=gh-pages
# Optional:
# DEPLOY_REMOTE=origin

: "${DEPLOY_BRANCH:?DEPLOY_BRANCH is required}"
DEPLOY_REMOTE="${DEPLOY_REMOTE:-origin}"

BUILD_DIR=".vitepress/dist"
TMP_DIR=".deploy-tmp"

# Clean temp dir
rm -rf "$TMP_DIR"
mkdir "$TMP_DIR"

# Copy build output
cp -r "$BUILD_DIR/." "$TMP_DIR/"

cd "$TMP_DIR"

# Init git repo
git init
git checkout -b "$DEPLOY_BRANCH"

# Add remote repo (assumes current repo origin)
REPO_URL=$(git -C .. config --get remote.origin.url)
git remote add origin "$REPO_URL"

# Commit & push
git add .
git commit -m "deploy: update site"

git push -f "$DEPLOY_REMOTE" "$DEPLOY_BRANCH"

cd ..
rm -rf "$TMP_DIR"