#!/bin/bash

cd /root/workspace/team-project 2>/dev/null || exit 1

# Count commits (should be more than the initial commit)
COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")

if [ "$COMMIT_COUNT" -lt 2 ]; then
  exit 1
fi

exit 0
