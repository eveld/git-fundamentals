#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Check if .git directory exists
if [ ! -d .git ]; then
  echo "No .git directory found. Run 'git init' to initialize the repository."
  exit 1
fi

# Verify it's a valid Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "Directory is not a valid Git repository"
  exit 1
fi

exit 0
