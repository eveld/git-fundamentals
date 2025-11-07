# Staging Changes

Git uses a **staging area** (also called the "index") as a middle ground between your working directory and the repository. Understanding staging is key to mastering Git's workflow.

## The Three Areas

Git organizes your work into three areas. The **working directory** is where you edit files - it's your normal workspace. The **staging area** (also called the index) is where you prepare changes for commit - think of it as a loading dock where you gather exactly what you want to save. The **repository** is where Git stores committed snapshots - your permanent history.

## Why Staging Matters

The staging area gives you precision and control over your commits. You can choose exactly which changes to include, review them before committing, and build commits piece by piece. This means you can work on multiple things at once but commit them separately. Modified five files today? Stage and commit the bug fix separate from the new feature. The staging area lets you tell a clean story with your commits, even when your work process was messy.

## Making Changes

Let's create multiple files and practice selective staging:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Create three new files
echo "def add(a, b): return a + b" > math_utils.py
echo "import math_utils" > main.py
echo "DEBUG = True" > config.py
</instruqt-code>

Check the status:

<instruqt-code language="bash">
git status
</instruqt-code>

You'll see all three files listed as untracked.

## Staging Individual Files

Let's stage them one at a time:

<instruqt-code language="bash">
# Stage just the math utilities
git add math_utils.py

# Check status
git status
</instruqt-code>

Notice that `math_utils.py` is now under "Changes to be committed" while the others remain untracked.

## Staging Multiple Files

Stage the remaining files:

<instruqt-code language="bash">
# Stage specific files
git add main.py config.py

# Or stage all at once
# git add .
</instruqt-code>

Check status again:

<instruqt-code language="bash">
git status
</instruqt-code>

All files should now be staged.

## Unstaging Files

What if you staged something by mistake? You can unstage it:

<instruqt-code language="bash">
# Unstage a file (keeps your changes in the working directory)
git reset main.py

# Check status
git status
</instruqt-code>

Now `main.py` is back to untracked, but the file itself hasn't changed.

## Staging Modified Files

The staging area also works with modifications. Let's modify a committed file:

<instruqt-code language="bash">
# Modify README
echo "## Features" >> README.md

# Check status
git status
</instruqt-code>

You'll see `README.md` listed under "Changes not staged for commit". Even though it's already tracked, modifications must be staged:

<instruqt-code language="bash">
git add README.md
</instruqt-code>

## Partial Staging

You can even stage parts of a file with `git add -p` (interactive patch mode), but that's an advanced topic we'll save for later.

## The git status Command

`git status` is your friend - run it constantly to understand where you are in the workflow. It shows which branch you're on, files staged for commit, files modified but not staged, and untracked files. It even provides helpful hints about what to do next, like suggesting `git add` for untracked files or how to unstage changes.

## Task

Practice staging multiple files. Create at least two new files in your repository and stage them both. When you're ready, complete the task below.

<instruqt-task id="staged_files"></instruqt-task>

