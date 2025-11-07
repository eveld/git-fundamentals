#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Must be on main branch
CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" != "main" ]; then
  echo "Switch to main branch first with 'git checkout main'"
  exit 1
fi

# Check if there's evidence of a merge (more than 1 commit on main)
COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null)

if [ "$COMMIT_COUNT" -lt 2 ]; then
  echo "No merge detected. Create commits on a feature branch and merge into main."
  exit 1
fi

exit 0
