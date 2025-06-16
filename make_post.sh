#!/usr/bin/env bash
# make_post.sh – create a dated Markdown draft from a title
#
# Usage:  ./make_post.sh "My Brilliant Post Title"

set -euo pipefail

if [[ $# -eq 0 ]]; then
  printf 'Usage: %s "Post Title"\n' "$0" >&2
  exit 1
fi

title="$*"

# Build a clean, URL‑friendly slug:
#   1. Strip accents (iconv)            eg. “résumé” → “resume”
#   2. Down‑case                        “Hello”     → “hello”
#   3. Replace non‑alphanumerics w/ ‑   “c++ tips”  → “c-tips”
#   4. Trim leading/trailing hyphens    “foo-”      → “foo”
slug=$(
  printf '%s' "$title"                       \
  | iconv -t ascii//TRANSLIT 2>/dev/null     \
  | tr '[:upper:]' '[:lower:]'               \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-|-$//g'
)

# Ensure the _drafts directory exists
drafts_dir="_drafts"
mkdir -p "$drafts_dir"

file="${drafts_dir}/2025-01-01-${slug}.md"

# Start the file with an H1 heading containing the original title
printf '# %s\n\n' "$title" > "$file"

printf 'Created %s\n' "$file"
