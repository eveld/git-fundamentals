#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

# Check if README.md is staged
if ! git diff --cached --name-only | grep -q "^README.md$"; then
  exit 1
fi

exit 0
