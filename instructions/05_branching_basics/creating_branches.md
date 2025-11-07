# Creating Branches

Branches are one of Git's most powerful features. They let you diverge from the main line of development and work independently without affecting other work.

## What is a Branch?

A branch is simply a lightweight, movable pointer to a commit. The default branch is called `main`.

When you create a branch, Git creates a new pointer - it doesn't copy files or make duplicate commits. This makes branching incredibly fast and cheap.

## Why Use Branches?

Branches are useful for:
- **Feature development**: Build new features without touching production code
- **Bug fixes**: Fix bugs in isolation
- **Experiments**: Try ideas without risk
- **Collaboration**: Multiple people working on different features simultaneously

## Viewing Current Branches

See what branches exist:

```bash
cd /root/workspace/my-project

# List all branches
git branch
```

You should see:
```
* main
```

The `*` indicates your current branch.

## Creating a New Branch

Create a branch with `git branch`:

```bash
# Create a new branch called "feature"
git branch feature

# List branches again
git branch
```

Now you'll see:
```
  feature
* main
```

The branch exists, but you're still on `main` (notice where the `*` is).

## Understanding What Happened

When you created `feature`, Git:
1. Created a new pointer named "feature"
2. Made it point to the same commit as `main`
3. Kept `HEAD` pointing to `main`

```
main → commit abc123
feature → commit abc123
HEAD → main
```

Both branches point to the same commit right now.

## Branch Naming Conventions

Good branch names are descriptive and follow a pattern:

**Feature branches:**
- `feature/user-auth`
- `feature/dark-mode`
- `add-search-functionality`

**Bug fixes:**
- `fix/login-crash`
- `bugfix/memory-leak`
- `fix-typo-in-readme`

**Experiments:**
- `experiment/new-algorithm`
- `try-different-approach`

Use lowercase and hyphens for readability.

## Creating Multiple Branches

You can create as many branches as you need:

```bash
# Create branches for different features
git branch feature/api-integration
git branch fix/typo
git branch experiment/refactor

# View all branches
git branch
```

## Viewing Branch Information

Get more details about branches:

```bash
# Show last commit on each branch
git branch -v

# Show all branches including remote tracking branches
git branch -a
```

## Where Branches Point

See exactly which commit each branch points to:

```bash
# Show branches with commit hashes
git log --oneline --all --decorate
```

The output shows branch names next to commits, making it easy to see where each branch is.

## Task

Create a new branch for feature development. You can name it anything you like (e.g., "feature", "experiment", "my-branch"). When you've created it, complete the task below.

<instruqt-task id="branch_created"></instruqt-task>

---

**Next:** Learn to switch between branches
