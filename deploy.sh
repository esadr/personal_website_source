#!/usr/bin/env bash

# Build the Hugo source and update the adjacent GitHub Pages repository.
# Usage: ./deploy.sh [commit message] [--push]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$(dirname "$SCRIPT_DIR")/esadr.github.io"
COMMIT_MESSAGE="${1:-}"
PUSH_MODE="${2:-}"

if [[ ! -d "$TARGET_DIR/.git" ]]; then
  echo "Expected the deployment repository at $TARGET_DIR." >&2
  exit 1
fi

TARGET_ORIGIN="$(git -C "$TARGET_DIR" remote get-url origin)"
if [[ "$TARGET_ORIGIN" != *"esadr/esadr.github.io.git" ]]; then
  echo "Refusing to deploy to unexpected remote: $TARGET_ORIGIN" >&2
  exit 1
fi

if [[ -n "$(git -C "$TARGET_DIR" status --porcelain)" ]]; then
  echo "The deployment repository has uncommitted changes. Commit or stash them first." >&2
  exit 1
fi

BUILD_DIR="$(mktemp -d "${TMPDIR:-/tmp}/personal-website-build.XXXXXX")"
cleanup() {
  rm -rf "$BUILD_DIR"
}
trap cleanup EXIT

echo "Building the site into a temporary directory..."
"$SCRIPT_DIR/scripts/hugo.sh" --minify --destination "$BUILD_DIR"

if [[ ! -f "$BUILD_DIR/index.html" ]]; then
  echo "Build did not produce index.html; deployment aborted." >&2
  exit 1
fi

if [[ ! -f "$TARGET_DIR/CNAME" ]]; then
  echo "The deployment repository is missing its CNAME file; deployment aborted." >&2
  exit 1
fi

echo "Synchronizing generated files to $TARGET_DIR..."
rsync --archive --delete --exclude='.git/' --exclude='CNAME' "$BUILD_DIR/" "$TARGET_DIR/"

git -C "$TARGET_DIR" add --all
git -C "$TARGET_DIR" status --short

if git -C "$TARGET_DIR" diff --cached --quiet; then
  echo "No generated changes to commit."
  exit 0
fi

if [[ -z "$COMMIT_MESSAGE" ]]; then
  read -r -p "Deployment commit message: " COMMIT_MESSAGE
fi

git -C "$TARGET_DIR" commit -m "$COMMIT_MESSAGE"

if [[ "$PUSH_MODE" == "--push" ]]; then
  git -C "$TARGET_DIR" push origin master
else
  read -r -p "Push the deployment commit to GitHub? (y/n): " PUSH_CONFIRM
  if [[ "$PUSH_CONFIRM" == "y" || "$PUSH_CONFIRM" == "Y" ]]; then
    git -C "$TARGET_DIR" push origin master
  else
    echo "Deployment commit created locally; push skipped."
  fi
fi
