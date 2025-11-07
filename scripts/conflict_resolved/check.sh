#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Check if merge is in progress
if [ -d .git/MERGE_HEAD ]; then
  echo "Merge still in progress. Resolve conflicts, stage files, and run 'git commit'"
  exit 1
fi

# Check for conflict markers in tracked files
if git grep -q "^<<<<<<< HEAD" 2>/dev/null; then
  echo "Conflict markers still present. Edit the file to resolve conflicts."
  exit 1
fi

exit 0
