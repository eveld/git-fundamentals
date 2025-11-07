# Understanding Conflicts

Not all merges are fast-forward merges. When two branches modify the same part of a file in different ways, Git can't automatically decide which change to keep. This is called a **merge conflict**.

## When Do Conflicts Happen?

Conflicts occur when two branches modify the same lines in a file, when one branch modifies a file while another deletes it, or when both branches create a file with the same name but different content. Git can merge changes in different parts of a file automatically, but when the same lines change in both branches, it needs your help deciding which version to keep.

## Why Conflicts Are Normal

Conflicts are a natural part of collaborative development. They happen when two developers work on the same feature, when you're working on a long-lived feature branch while main continues to evolve, or when parallel bug fixes touch the same code. In active projects with multiple contributors, conflicts are inevitable and frequent.

Don't panic when you see a conflict - it just means Git needs your help deciding what the final version should look like. Git is being cautious by not making assumptions about which changes should win. This is actually a feature, not a bug - it prevents Git from silently choosing the wrong version and creating subtle bugs.

## Diverged Branches

Fast-forward merges work when branches haven't diverged. But look at this scenario:

<instruqt-code language="text">
        main: A → B → C
                   ↓
        feature:   B → D → E
</instruqt-code>

Both branches have new commits after B:
- Main has commit C
- Feature has commits D and E

If C and E modified the same lines in a file, Git can't merge them automatically.

## The Three-Way Merge

When branches diverge, Git performs a **three-way merge**:

<instruqt-code language="text">
        main: A → B → C ────┐
                   ↓         ↓
        feature:   B → D → E → M
</instruqt-code>

Git creates a new merge commit (M) that combines both C and E. This merge commit has two parents: C and E.

If the changes don't overlap, Git handles this automatically. If they do overlap, you get a conflict.

## Visualizing Diverged Branches

Let's create a scenario with diverged branches:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Make sure you're on main with at least one commit
git checkout main

# Create a file that both branches will modify
echo "Line 1: Original" > conflict-demo.txt
git add conflict-demo.txt
git commit -m "Add conflict demo file"

# Create a feature branch
git checkout -b feature-branch

# Modify the file on feature branch
echo "Line 1: Modified by feature" > conflict-demo.txt
git add conflict-demo.txt
git commit -m "Modify line 1 in feature"

# Switch back to main
git checkout main

# Modify the SAME line differently
echo "Line 1: Modified by main" > conflict-demo.txt
git add conflict-demo.txt
git commit -m "Modify line 1 in main"
</instruqt-code>

Now visualize the divergence:

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

You'll see something like:

<instruqt-code language="text">
* 3456789 (HEAD -> main) Modify line 1 in main
| * 2345678 (feature-branch) Modify line 1 in feature
|/
* 1234567 Add conflict demo file
</instruqt-code>

The branches have diverged!

## What Happens During a Conflict

Try to merge now:

<instruqt-code language="bash">
git merge feature-branch
</instruqt-code>

You'll see:

<instruqt-code language="text">
Auto-merging conflict-demo.txt
CONFLICT (content): Merge conflict in conflict-demo.txt
Automatic merge failed; fix conflicts and then commit the result.
</instruqt-code>

Git is telling you it tried to merge `conflict-demo.txt`, found a conflict in that file, and needs you to fix it manually before the merge can complete.

## Checking Conflict Status

See what's going on:

<instruqt-code language="bash">
git status
</instruqt-code>

You'll see:

<instruqt-code language="text">
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   conflict-demo.txt
</instruqt-code>

Git is in the middle of a merge, waiting for you to resolve the conflict.

## Conflict Markers

Look at the conflicted file:

<instruqt-code language="bash">
cat conflict-demo.txt
</instruqt-code>

You'll see conflict markers:

<instruqt-code language="text">
<<<<<<< HEAD
Line 1: Modified by main
=======
Line 1: Modified by feature
>>>>>>> feature-branch
</instruqt-code>

Let's break this down:

- `<<<<<<< HEAD` - Marks the start of your current branch's version
- `=======` - Divides the two versions
- `>>>>>>> feature-branch` - Marks the end of the branch you're merging

Everything between `<<<<<<< HEAD` and `=======` is from your current branch (main).

Everything between `=======` and `>>>>>>> feature-branch` is from the branch you're merging (feature-branch).

## Types of Conflicts

**Content Conflict**: Both branches modified the same lines (most common)

**Deletion Conflict**: One branch modified a file, the other deleted it

**Add-Add Conflict**: Both branches created a new file with the same name

## Avoiding Conflicts

While you can't always avoid conflicts, you can minimize them through good practices. Merge or rebase frequently to keep branches in sync - the longer branches diverge, the more likely conflicts become. Communicate with team members about what you're working on so you don't both modify the same files simultaneously. Keep commits focused and small so conflicts, when they do occur, are easier to understand and resolve. Consider using feature flags instead of long-lived branches, allowing you to merge incomplete features into main without exposing them to users.

