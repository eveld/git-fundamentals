# Understanding Conflicts

Not all merges are fast-forward merges. When two branches modify the same part of a file in different ways, Git can't automatically decide which change to keep. This is called a **merge conflict**.

## When Do Conflicts Happen?

Conflicts occur when:
1. Two branches modify the same lines in a file
2. One branch modifies a file while another deletes it
3. Both branches create a file with the same name but different content

## Why Conflicts Are Normal

Conflicts are a natural part of collaborative development. They happen when:
- Two developers work on the same feature
- You're working on a long-lived feature branch while main continues to evolve
- Parallel bug fixes touch the same code

Don't panic when you see a conflict - it just means Git needs your help deciding what the final version should look like.

## Diverged Branches

Fast-forward merges work when branches haven't diverged. But look at this scenario:

```
        main: A → B → C
                   ↓
        feature:   B → D → E
```

Both branches have new commits after B:
- Main has commit C
- Feature has commits D and E

If C and E modified the same lines in a file, Git can't merge them automatically.

## The Three-Way Merge

When branches diverge, Git performs a **three-way merge**:

```
        main: A → B → C ────┐
                   ↓         ↓
        feature:   B → D → E → M
```

Git creates a new merge commit (M) that combines both C and E. This merge commit has two parents: C and E.

If the changes don't overlap, Git handles this automatically. If they do overlap, you get a conflict.

## Visualizing Diverged Branches

Let's create a scenario with diverged branches:

```bash
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
```

Now visualize the divergence:

```bash
git log --oneline --graph --all
```

You'll see something like:

```
* 3456789 (HEAD -> main) Modify line 1 in main
| * 2345678 (feature-branch) Modify line 1 in feature
|/
* 1234567 Add conflict demo file
```

The branches have diverged!

## What Happens During a Conflict

Try to merge now:

```bash
git merge feature-branch
```

You'll see:

```
Auto-merging conflict-demo.txt
CONFLICT (content): Merge conflict in conflict-demo.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Git is telling you:
1. It tried to merge `conflict-demo.txt`
2. There's a conflict in that file
3. You need to fix it manually

## Checking Conflict Status

See what's going on:

```bash
git status
```

You'll see:

```
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   conflict-demo.txt
```

Git is in the middle of a merge, waiting for you to resolve the conflict.

## Conflict Markers

Look at the conflicted file:

```bash
cat conflict-demo.txt
```

You'll see conflict markers:

```
<<<<<<< HEAD
Line 1: Modified by main
=======
Line 1: Modified by feature
>>>>>>> feature-branch
```

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

While you can't always avoid conflicts, you can minimize them:
1. Merge or rebase frequently to keep branches in sync
2. Communicate with team members about what you're working on
3. Keep commits focused and small
4. Use feature flags instead of long-lived branches

## Key Points

- Conflicts happen when branches modify the same code differently
- Git marks conflicts with special markers: `<<<<<<<`, `=======`, `>>>>>>>`
- Three-way merges create a merge commit with two parents
- Conflicts are normal and not something to fear
- `git status` shows which files have conflicts
- You must manually resolve conflicts before completing the merge

---

**Next:** Learn how to resolve conflicts
