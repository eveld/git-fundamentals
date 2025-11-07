# Switching Branches

Creating a branch is just the first step. To actually work on a branch, you need to switch to it. This moves `HEAD` to point to the branch.

## Switching Branches with git checkout

The traditional way to switch branches:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Switch to your feature branch
git checkout feature

# Confirm you've switched
git branch
</instruqt-code>

Now you should see:
<instruqt-code language="text">
* feature
  main
</instruqt-code>

The `*` moved to `feature`, indicating that's your current branch.

## What Happens When You Switch?

When you checkout a branch, Git:
1. Updates `HEAD` to point to the new branch
2. Updates your working directory files to match the branch's commit
3. Updates the staging area

<instruqt-code language="text">
Before:  HEAD → main → commit abc123
After:   HEAD → feature → commit abc123
</instruqt-code>

## Making Changes on a Branch

Now that you're on the feature branch, let's make some changes:

<instruqt-code language="bash">
# Create a new file on the feature branch
echo "def new_feature(): return 'awesome'" > feature.py

# Stage and commit
git add feature.py
git commit -m "Add new feature function"
</instruqt-code>

Check the log:

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

You'll see that `feature` has moved forward to the new commit, while `main` stayed where it was:

<instruqt-code language="text">
* abc1234 (HEAD -> feature) Add new feature function
* def5678 (main) Previous commit
</instruqt-code>

## Switching Back to Main

Switch back to the main branch:

<instruqt-code language="bash">
git checkout main
</instruqt-code>

Notice what happened:
- `feature.py` disappeared! (It only exists on the feature branch)
- Your working directory now matches main's commit

List files to confirm:

<instruqt-code language="bash">
ls
</instruqt-code>

`feature.py` isn't there. Don't worry - it's safe on the feature branch.

## The Modern Way: git switch

Git 2.23 (2019) introduced a clearer command:

<instruqt-code language="bash">
# Switch to a branch
git switch feature

# Switch back to main
git switch main
</instruqt-code>

`git switch` is specifically for switching branches, while `git checkout` has many other uses. Using `git switch` makes your intent clearer.

## Creating and Switching in One Command

The most common workflow combines creating and switching:

<instruqt-code language="bash">
# Old way
git branch new-branch
git checkout new-branch

# Shortcut with git checkout
git checkout -b new-branch

# Modern way with git switch
git switch -c new-branch
</instruqt-code>

All three approaches create a new branch and switch to it immediately.

## Practical Example

Let's say you need to fix a bug while working on a feature:

<instruqt-code language="bash">
# You're on feature branch, working away
git checkout feature
# ... editing files ...

# Suddenly, you need to fix a critical bug
# Save your feature work first
git add .
git commit -m "WIP: partial feature implementation"

# Switch to main
git checkout main

# Create a bugfix branch
git checkout -b fix/critical-bug

# Fix the bug
echo "fixed" > bug-fix.py
git add bug-fix.py
git commit -m "Fix critical bug"

# Back to main
git checkout main

# Now back to your feature
git checkout feature
# Continue where you left off
</instruqt-code>

## Uncommitted Changes Warning

If you have uncommitted changes, Git may prevent you from switching:

<instruqt-code language="bash">
# Make a change
echo "temp" > temp.txt

# Try to switch
git checkout main
</instruqt-code>

Git warns: `error: Your local changes would be overwritten by checkout`

You have three options:
1. Commit the changes: `git commit -am "Save work"`
2. Stash the changes: `git stash` (covered in advanced labs)
3. Discard the changes: `git checkout -- temp.txt`

## Viewing Branch Differences

Compare branches to see what's different:

<instruqt-code language="bash">
# See commits on feature that aren't on main
git log main..feature

# See file differences between branches
git diff main..feature
</instruqt-code>


