#!/bin/bash

USER_NAME=$(git config --global user.name)

if [ -z "$USER_NAME" ]; then
  exit 1
fi

exit 0
