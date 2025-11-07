#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if [ -f .git/MERGE_HEAD ]; then
  exit 1
fi

exit 0
