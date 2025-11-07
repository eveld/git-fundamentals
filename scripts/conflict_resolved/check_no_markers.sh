#!/bin/bash

cd /root/workspace/my-project 2>/dev/null || exit 1

if git grep -q "^<<<<<<< HEAD" 2>/dev/null; then
  exit 1
fi

exit 0
