#!/usr/bin/env bash
set -euo pipefail

required_files=(
  ".editorconfig"
  ".github/PULL_REQUEST_TEMPLATE.md"
  ".github/dependabot.yml"
  ".github/workflows/cd.yml"
  ".github/workflows/ci.yml"
  ".gitignore"
  "CONTRIBUTING.md"
  "LICENSE"
  "README.md"
  "docs/BRANCH_PROTECTION.md"
)

failure_count=0

for required_file in "${required_files[@]}"; do
  if [[ ! -f "$required_file" ]]; then
    echo "ERROR: required file is missing: $required_file" >&2
    failure_count=$((failure_count + 1))
  fi
done

if [[ "$failure_count" -ne 0 ]]; then
  echo "Repository validation failed with $failure_count error(s)." >&2
  exit 1
fi

echo "Repository validation passed."
