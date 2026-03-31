#!/usr/bin/env sh
set -eu

npm ci
npm run build

# Required:
# DEPLOY_HOST=your-server.com
# DEPLOY_USER=deploy
# DEPLOY_PATH=/var/www/blog
#
# Optional:
# DEPLOY_PORT=22
# DEPLOY_METHOD=rsync|scp (default: rsync)

: "${DEPLOY_HOST:?DEPLOY_HOST is required}"
: "${DEPLOY_USER:?DEPLOY_USER is required}"
: "${DEPLOY_PATH:?DEPLOY_PATH is required}"

DEPLOY_PORT="${DEPLOY_PORT:-22}"
DEPLOY_METHOD="${DEPLOY_METHOD:-rsync}"

if [ "$DEPLOY_METHOD" = "rsync" ]; then
  rsync -avz --delete -e "ssh -p $DEPLOY_PORT" ".vitepress/dist/" "$DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH/"
elif [ "$DEPLOY_METHOD" = "scp" ]; then
  ssh -p "$DEPLOY_PORT" "$DEPLOY_USER@$DEPLOY_HOST" "mkdir -p '$DEPLOY_PATH'"
  scp -P "$DEPLOY_PORT" -r ".vitepress/dist/." "$DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH/"
else
  echo "Unknown DEPLOY_METHOD: $DEPLOY_METHOD (use rsync or scp)"
  exit 1
fi
