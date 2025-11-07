# Fast-Forward Merges

Once you've finished work on a branch, you'll want to integrate those changes back into your main branch. This is called **merging**.

## What is Merging?

Merging takes the changes from one branch and incorporates them into another. The simplest type of merge is a **fast-forward merge**.

## Understanding Fast-Forward Merges

A fast-forward merge happens when the branch you're merging has commits that are direct descendants of the current branch.

Here's the scenario:

<instruqt-code language="text">
main:    A → B
              ↓
feature:      B → C → D
</instruqt-code>

Main is at commit B, and feature has commits C and D that come after B. There's a direct line from B to D.

When you merge feature into main, Git can simply move the main pointer forward to D:

<instruqt-code language="text">
main:    A → B → C → D
feature:         ↑
</instruqt-code>

This is called a "fast-forward" because Git just moves the pointer forward - no new commit is created.

## Let's Try It

First, make sure you have a feature branch with commits:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Create and switch to a new branch
git checkout -b feature

# Make a change
echo "New feature code" > feature.py
git add feature.py
git commit -m "Add new feature"

# Make another change on the same branch
echo "More feature code" >> feature.py
git add feature.py
git commit -m "Extend feature"
</instruqt-code>

<instruqt-task id="commits_on_branch"></instruqt-task>

Check the log:

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

You'll see feature is ahead of main:

<instruqt-code language="text">
* 3456789 (HEAD -> feature) Extend feature
* 2345678 Add new feature
* 1234567 (main) Previous commit
</instruqt-code>

## Performing the Merge

Switch back to main and merge:

<instruqt-code language="bash">
# Switch to main
git checkout main
</instruqt-code>

<instruqt-task id="switch_to_main"></instruqt-task>

<instruqt-code language="bash">
# Merge feature branch
git merge feature
</instruqt-code>

You'll see output like:

<instruqt-code language="text">
Updating 1234567..3456789
Fast-forward
 feature.py | 2 ++
 1 file changed, 2 insertions(+)
</instruqt-code>

Notice the "Fast-forward" message - that's the key indicator.

## What Happened?

Check the log again:

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

Now you'll see:

<instruqt-code language="text">
* 3456789 (HEAD -> main, feature) Extend feature
* 2345678 Add new feature
* 1234567 Previous commit
</instruqt-code>

Both `main` and `feature` point to the same commit. Git simply moved the `main` pointer forward.

## When Fast-Forward Merges Happen

Fast-forward merges occur when:
1. The target branch (main) hasn't changed since you created the feature branch
2. The feature branch is a direct descendant
3. There's a linear path from target to feature

This is common when you're the only person working on the code, or when working on a specific feature in isolation.

## Deleting Merged Branches

After merging, you typically don't need the feature branch anymore:

<instruqt-code language="bash">
# Delete the feature branch
git branch -d feature

# Verify it's gone
git branch
</instruqt-code>

The `-d` flag safely deletes a branch (Git prevents deletion if the branch isn't fully merged).

## Preventing Fast-Forward Merges

Sometimes you want to preserve the branch history. You can force Git to create a merge commit:

<instruqt-code language="bash">
# Merge without fast-forward
git merge --no-ff feature
</instruqt-code>

This creates a merge commit even when a fast-forward is possible. This is more common in team environments where you want to see that a feature branch existed.

## The Merge Workflow

Here's the complete workflow:

<instruqt-code language="bash">
# 1. Create a feature branch
git checkout -b new-feature

# 2. Make changes and commit
echo "feature work" > file.txt
git add file.txt
git commit -m "Implement feature"

# 3. Switch back to main
git checkout main

# 4. Merge the feature
git merge new-feature

# 5. Delete the feature branch
git branch -d new-feature
</instruqt-code>

## Checking Merge Status

Before merging, you can check if a fast-forward is possible:

<instruqt-code language="bash">
# See what would be merged
git log main..feature --oneline

# See if branches have diverged
git log --oneline --graph main feature
</instruqt-code>

## Task

Create a feature branch, make one or more commits on it, then merge it back into main using a fast-forward merge. When you've successfully merged, complete the task below.

<instruqt-task id="branch_merged"></instruqt-task>

