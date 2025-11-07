#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)

# Must not be on main
if [ "$CURRENT_BRANCH" = "main" ]; then
  exit 1
fi

# Must have at least one commit
COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")

if [ "$COMMIT_COUNT" -lt 1 ]; then
  exit 1
fi

exit 0
