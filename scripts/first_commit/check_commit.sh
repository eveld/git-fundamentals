#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if [ ! -d .git ]; then
  exit 1
fi

COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")

if [ "$COMMIT_COUNT" -lt 1 ]; then
  exit 1
fi

exit 0
