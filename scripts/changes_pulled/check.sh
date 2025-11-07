#!/bin/bash

cd /root/workspace/team-project 2>/dev/null || exit 1

# Fetch latest changes
git fetch origin > /dev/null 2>&1

# Check if local main is up to date with origin/main
LOCAL=$(git rev-parse main 2>/dev/null)
REMOTE=$(git rev-parse origin/main 2>/dev/null)

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "Local branch is behind origin/main. Pull changes with: git pull origin main"
  exit 1
fi

exit 0
