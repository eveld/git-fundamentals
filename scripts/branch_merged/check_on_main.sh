#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" != "main" ]; then
  exit 1
fi

exit 0
