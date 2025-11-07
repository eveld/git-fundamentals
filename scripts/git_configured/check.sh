#!/bin/bash

# Check if user.name is configured
USER_NAME=$(git config --global user.name)

if [ -z "$USER_NAME" ]; then
  echo "Git user name is not configured"
  exit 1
fi

# Check if user.email is configured
USER_EMAIL=$(git config --global user.email)

if [ -z "$USER_EMAIL" ]; then
  echo "Git user email is not configured"
  exit 1
fi

exit 0
