#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if [ ! -d .git ]; then
  exit 1
fi

if ! git rev-parse --git-dir > /dev/null 2>&1; then
  exit 1
fi

exit 0
