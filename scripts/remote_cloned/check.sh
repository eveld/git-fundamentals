#!/bin/bash

# Check if team-project directory exists
if [ ! -d /root/workspace/team-project ]; then
  echo "Team project not found. Clone it with: git clone /opt/git/team-project.git"
  exit 1
fi

cd /root/workspace/team-project || exit 1

# Check if it's a git repo
if [ ! -d .git ]; then
  echo "team-project is not a Git repository"
  exit 1
fi

# Check if origin remote is configured
if ! git remote -v | grep -q "origin"; then
  echo "No origin remote configured"
  exit 1
fi

exit 0
