#!/bin/bash

cd /root/workspace/team-project 2>/dev/null || exit 1

# Check if there are unpushed commits
UNPUSHED=$(git log origin/main..HEAD --oneline 2>/dev/null | wc -l)

if [ "$UNPUSHED" -gt 0 ]; then
  echo "You have unpushed commits. Push them with: git push origin main"
  exit 1
fi

exit 0
