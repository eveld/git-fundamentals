#!/bin/bash
set -e

# Set system-wide defaults (NOT user identity - users will configure that themselves)
git config --global init.defaultBranch main
git config --global core.editor "nano"

# Create directory for bare repositories (hidden from students)
mkdir -p /opt/git

# Create primary bare repository for remote exercises
mkdir -p /opt/git/origin.git
cd /opt/git/origin.git
git init --bare --quiet

# Create a second bare repo for collaboration exercises
mkdir -p /opt/git/team-project.git
cd /opt/git/team-project.git
git init --bare --quiet

# Initialize with a README so students have something to clone
# Use local config here (not global) so students still need to configure their identity
mkdir -p /tmp/init-repo
cd /tmp/init-repo
git init --quiet
git config user.name "System Setup"
git config user.email "setup@instruqt.lab"
echo "# Team Project" > README.md
echo "Welcome to the team project repository!" >> README.md
git add README.md
git commit --quiet -m "Initial commit"
git remote add origin /opt/git/team-project.git
git push --quiet origin main
cd /
rm -rf /tmp/init-repo

# Create student workspace directories
mkdir -p /root/workspace
mkdir -p /root/dev1
mkdir -p /root/dev2

# Set up initial workspace for chapters 1-6
cd /root/workspace
echo "Student workspace ready" > .workspace_ready

echo "Git lab environment initialized successfully!"
