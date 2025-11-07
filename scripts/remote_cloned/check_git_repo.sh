#!/bin/bash

cd /root/workspace/team-project 2>/dev/null || exit 1

if [ ! -d .git ]; then
  exit 1
fi

exit 0
