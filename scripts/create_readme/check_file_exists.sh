#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if [ ! -f README.md ]; then
  exit 1
fi

exit 0
