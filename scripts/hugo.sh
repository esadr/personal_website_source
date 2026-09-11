#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EXPECTED_VERSION="$(sed -n "s/^[[:space:]]*hugo_version:[[:space:]]*['\"]\([^'\"]*\)['\"].*/\1/p" "$PROJECT_ROOT/hugoblox.yaml")"

if [[ -n "${HUGO_BIN:-}" ]]; then
  HUGO_COMMAND="$HUGO_BIN"
elif [[ -x "$PROJECT_ROOT/../.tools/bin/hugo" ]]; then
  HUGO_COMMAND="$PROJECT_ROOT/../.tools/bin/hugo"
elif command -v hugo >/dev/null 2>&1; then
  HUGO_COMMAND="$(command -v hugo)"
else
  echo "Hugo $EXPECTED_VERSION is required but was not found." >&2
  exit 1
fi

INSTALLED_VERSION="$($HUGO_COMMAND version)"
if [[ "$INSTALLED_VERSION" != "hugo v${EXPECTED_VERSION}"* ]]; then
  echo "Expected Hugo $EXPECTED_VERSION, but found: $INSTALLED_VERSION" >&2
  echo "Set HUGO_BIN to a compatible Hugo executable." >&2
  exit 1
fi

exec "$HUGO_COMMAND" "$@"
