# Staging Changes

Git uses a **staging area** (also called the "index") as a middle ground between your working directory and the repository. Understanding staging is key to mastering Git's workflow.

## The Three Areas

Git organizes your work into three areas:

1. **Working Directory**: Where you edit files
2. **Staging Area**: Where you prepare changes for commit
3. **Repository**: Where Git stores committed snapshots

## Why Staging Matters

The staging area lets you:
- Choose exactly which changes to include in a commit
- Review changes before committing
- Build commits piece by piece
- Commit related changes together

## Making Changes

Let's create multiple files and practice selective staging:

```bash
cd /root/workspace/my-project

# Create three new files
echo "def add(a, b): return a + b" > math_utils.py
echo "import math_utils" > main.py
echo "*.pyc" > .gitignore
```

Check the status:

```bash
git status
```

You'll see all three files listed as untracked.

## Staging Individual Files

Let's stage them one at a time:

```bash
# Stage just the math utilities
git add math_utils.py

# Check status
git status
```

Notice that `math_utils.py` is now under "Changes to be committed" while the others remain untracked.

## Staging Multiple Files

Stage the remaining files:

```bash
# Stage specific files
git add main.py .gitignore

# Or stage all at once
# git add .
```

Check status again:

```bash
git status
```

All files should now be staged.

## Unstaging Files

What if you staged something by mistake? You can unstage it:

```bash
# Unstage a file (keeps your changes in the working directory)
git reset main.py

# Check status
git status
```

Now `main.py` is back to untracked, but the file itself hasn't changed.

## Staging Modified Files

The staging area also works with modifications. Let's modify a committed file:

```bash
# Modify README
echo "## Features" >> README.md

# Check status
git status
```

You'll see `README.md` listed under "Changes not staged for commit". Even though it's already tracked, modifications must be staged:

```bash
git add README.md
```

## Partial Staging

You can even stage parts of a file with `git add -p` (interactive patch mode), but that's an advanced topic we'll save for later.

## The git status Command

`git status` is your friend. It shows:
- Which branch you're on
- Files staged for commit
- Files modified but not staged
- Untracked files
- Helpful hints about what to do next

## Task

Practice staging multiple files. Create at least two new files in your repository and stage them both. When you're ready, complete the task below.

<instruqt-task id="staged_files"></instruqt-task>

---

**Next:** Understand the complete commit workflow
