#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Count staged files
STAGED_COUNT=$(git diff --cached --name-only | wc -l)

if [ "$STAGED_COUNT" -lt 2 ]; then
  echo "Not enough files staged. Stage at least 2 files using 'git add <file>'"
  exit 1
fi

exit 0
