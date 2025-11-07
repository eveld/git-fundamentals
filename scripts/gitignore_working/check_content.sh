#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if [ ! -f .gitignore ]; then
  exit 1
fi

if [ ! -s .gitignore ]; then
  exit 1
fi

exit 0
