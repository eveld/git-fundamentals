#!/bin/bash

cd /root/workspace/my-project || exit 1

# Create README if it doesn't exist
if [ ! -f README.md ]; then
  echo "# My Project" > README.md
fi

# Stage and commit
git add README.md
git commit -m "Add README file" > /dev/null 2>&1

exit 0
