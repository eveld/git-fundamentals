#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null)

if [ "$COMMIT_COUNT" -lt 2 ]; then
  exit 1
fi

exit 0
