#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Check if .gitignore exists
if [ ! -f .gitignore ]; then
  echo ".gitignore file not found. Create it with patterns to ignore files."
  exit 1
fi

# Check if .gitignore is committed
if ! git ls-files | grep -q "^\.gitignore$"; then
  echo ".gitignore exists but is not committed. Stage and commit it."
  exit 1
fi

# Check if .gitignore has content
if [ ! -s .gitignore ]; then
  echo ".gitignore is empty. Add patterns to ignore files (e.g., *.log, temp/)"
  exit 1
fi

exit 0
