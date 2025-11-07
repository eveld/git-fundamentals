# Fast-Forward Merges

Once you've finished work on a branch, you'll want to integrate those changes back into your main branch. This is called **merging**.

## What is Merging?

Merging takes the changes from one branch and incorporates them into another. The simplest type of merge is a **fast-forward merge**.

## Understanding Fast-Forward Merges

A fast-forward merge happens when the branch you're merging has commits that are direct descendants of the current branch.

Here's the scenario:

```
main:    A → B
              ↓
feature:      B → C → D
```

Main is at commit B, and feature has commits C and D that come after B. There's a direct line from B to D.

When you merge feature into main, Git can simply move the main pointer forward to D:

```
main:    A → B → C → D
feature:         ↑
```

This is called a "fast-forward" because Git just moves the pointer forward - no new commit is created.

## Let's Try It

First, make sure you have a feature branch with commits:

```bash
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
```

<instruqt-task id="commits_on_branch"></instruqt-task>

Check the log:

```bash
git log --oneline --graph --all
```

You'll see feature is ahead of main:

```
* 3456789 (HEAD -> feature) Extend feature
* 2345678 Add new feature
* 1234567 (main) Previous commit
```

## Performing the Merge

Switch back to main and merge:

```bash
# Switch to main
git checkout main
```

<instruqt-task id="switch_to_main"></instruqt-task>

```bash
# Merge feature branch
git merge feature
```

You'll see output like:

```
Updating 1234567..3456789
Fast-forward
 feature.py | 2 ++
 1 file changed, 2 insertions(+)
```

Notice the "Fast-forward" message - that's the key indicator.

## What Happened?

Check the log again:

```bash
git log --oneline --graph --all
```

Now you'll see:

```
* 3456789 (HEAD -> main, feature) Extend feature
* 2345678 Add new feature
* 1234567 Previous commit
```

Both `main` and `feature` point to the same commit. Git simply moved the `main` pointer forward.

## When Fast-Forward Merges Happen

Fast-forward merges occur when:
1. The target branch (main) hasn't changed since you created the feature branch
2. The feature branch is a direct descendant
3. There's a linear path from target to feature

This is common when you're the only person working on the code, or when working on a specific feature in isolation.

## Deleting Merged Branches

After merging, you typically don't need the feature branch anymore:

```bash
# Delete the feature branch
git branch -d feature

# Verify it's gone
git branch
```

The `-d` flag safely deletes a branch (Git prevents deletion if the branch isn't fully merged).

## Preventing Fast-Forward Merges

Sometimes you want to preserve the branch history. You can force Git to create a merge commit:

```bash
# Merge without fast-forward
git merge --no-ff feature
```

This creates a merge commit even when a fast-forward is possible. This is more common in team environments where you want to see that a feature branch existed.

## The Merge Workflow

Here's the complete workflow:

```bash
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
```

## Checking Merge Status

Before merging, you can check if a fast-forward is possible:

```bash
# See what would be merged
git log main..feature --oneline

# See if branches have diverged
git log --oneline --graph main feature
```

## Task

Create a feature branch, make one or more commits on it, then merge it back into main using a fast-forward merge. When you've successfully merged, complete the task below.

<instruqt-task id="branch_merged"></instruqt-task>

---

**Next:** Learn how to handle merge conflicts
