#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || {
  echo "Project directory not found"
  exit 1
}

# Check if repository is initialized
if [ ! -d .git ]; then
  echo "Not a Git repository. Run 'git init' first."
  exit 1
fi

# Check if at least one commit exists
COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")

if [ "$COMMIT_COUNT" -lt 1 ]; then
  echo "No commits found. Create a file, stage it with 'git add', and commit with 'git commit -m \"message\"'"
  exit 1
fi

# Check if README.md exists and is committed
if ! git ls-files | grep -q "README.md"; then
  echo "README.md not found in repository. Add and commit README.md"
  exit 1
fi

exit 0
