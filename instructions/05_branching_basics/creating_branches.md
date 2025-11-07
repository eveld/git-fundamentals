# Creating Branches

Branches are one of Git's most powerful features. They let you diverge from the main line of development and work independently without affecting other work.

## What is a Branch?

A branch is simply a lightweight, movable pointer to a commit. The default branch is called `main`.

When you create a branch, Git creates a new pointer - it doesn't copy files or make duplicate commits. This makes branching incredibly fast and cheap.

## Why Use Branches?

Imagine you're working on a major new feature that will take a week to complete. Meanwhile, a critical bug appears in production that needs fixing immediately. Without branches, you're stuck - your half-finished feature code is mixed in with the stable code, and you can't easily separate them.

Branches solve this perfectly. You can build new features on a branch without touching production code, keeping your main branch stable and deployable. You can fix bugs in isolation on their own branches, then merge them back when done. You can experiment with new ideas without risk - if the experiment fails, just delete the branch and nothing is lost. Multiple people can work on different features simultaneously, each on their own branch, without interfering with each other. Branches make parallel development practical and safe.

## Viewing Current Branches

See what branches exist:

<instruqt-code language="bash">
cd /root/workspace/my-project

# List all branches
git branch
</instruqt-code>

You should see:
<instruqt-code language="text">
* main
</instruqt-code>

The `*` indicates your current branch.

## Creating a New Branch

Create a branch with `git branch`:

<instruqt-code language="bash">
# Create a new branch called "feature"
git branch feature

# List branches again
git branch
</instruqt-code>

Now you'll see:
<instruqt-code language="text">
  feature
* main
</instruqt-code>

The branch exists, but you're still on `main` (notice where the `*` is).

## Understanding What Happened

When you created `feature`, Git:
1. Created a new pointer named "feature"
2. Made it point to the same commit as `main`
3. Kept `HEAD` pointing to `main`

<instruqt-code language="text">
main → commit abc123
feature → commit abc123
HEAD → main
</instruqt-code>

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

<instruqt-code language="bash">
# Create branches for different features
git branch feature/api-integration
git branch fix/typo
git branch experiment/refactor

# View all branches
git branch
</instruqt-code>

## Viewing Branch Information

Get more details about branches:

<instruqt-code language="bash">
# Show last commit on each branch
git branch -v

# Show all branches including remote tracking branches
git branch -a
</instruqt-code>

## Where Branches Point

See exactly which commit each branch points to:

<instruqt-code language="bash">
# Show branches with commit hashes
git log --oneline --all --decorate
</instruqt-code>

The output shows branch names next to commits, making it easy to see where each branch is.

## Task

Create a new branch for feature development. You can name it anything you like (e.g., "feature", "experiment", "my-branch"). When you've created it, complete the task below.

<instruqt-task id="branch_created"></instruqt-task>

