#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if ! git ls-files | grep -q "^\.gitignore$"; then
  exit 1
fi

exit 0
