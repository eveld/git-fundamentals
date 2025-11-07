#!/bin/bash

USER_EMAIL=$(git config --global user.email)

if [ -z "$USER_EMAIL" ]; then
  exit 1
fi

exit 0
