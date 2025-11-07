#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Get all branches except main
BRANCH_COUNT=$(git branch | grep -v "main" | grep -v "^*" | wc -l)

if [ "$BRANCH_COUNT" -lt 1 ]; then
  echo "No branches found besides main. Create a new branch with 'git branch <name>' or 'git checkout -b <name>'"
  exit 1
fi

exit 0
