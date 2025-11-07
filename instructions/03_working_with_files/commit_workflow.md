# The Commit Workflow

Let's solidify your understanding of Git's core workflow: **Modify → Stage → Commit**. This cycle is fundamental to everything you'll do with Git.

## The Three-Step Cycle

Every change you make follows this pattern:

<instruqt-code language="text">
Working Directory  →  Staging Area  →  Repository
    (edit)              (git add)       (git commit)
</instruqt-code>

Let's walk through a complete workflow.

## Step 1: Modify

Make changes in your working directory:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Modify an existing file
echo "# Project Goals" >> README.md
echo "- Learn Git fundamentals" >> README.md
echo "- Master the commit workflow" >> README.md

# Create a new file
echo "TODO: Add tests" > TODO.txt
</instruqt-code>

Check what changed:

<instruqt-code language="bash">
git status
</instruqt-code>

You'll see:
- `README.md` listed as modified
- `TODO.txt` listed as untracked

View the specific changes:

<instruqt-code language="bash">
# See what changed in modified files
git diff
</instruqt-code>

This shows the exact lines added or removed. Press `q` to exit.

## Step 2: Stage

Select which changes to include in your next commit:

<instruqt-code language="bash">
# Stage both files
git add README.md TODO.txt

# Or stage everything
# git add .
</instruqt-code>

Check status again:

<instruqt-code language="bash">
git status
</instruqt-code>

Now both files appear under "Changes to be committed".

To see what's staged:

<instruqt-code language="bash">
git diff --staged
</instruqt-code>

This shows the changes that will be included in the next commit.

## Step 3: Commit

Create a snapshot with a descriptive message:

<instruqt-code language="bash">
git commit -m "Add project goals and TODO list"
</instruqt-code>

Verify the commit was created:

<instruqt-code language="bash">
git log --oneline
</instruqt-code>

## Writing Good Commit Messages

A good commit message:
- Starts with a verb in imperative mood ("Add", "Fix", "Update")
- Is concise but descriptive
- Explains *what* and *why*, not *how*

**Good examples:**
- `"Add user authentication feature"`
- `"Fix memory leak in cache handler"`
- `"Update README with installation instructions"`

**Poor examples:**
- `"Changed stuff"` (too vague)
- `"Fixed bug"` (which bug?)
- `"asdfasdf"` (not helpful)

## The Complete Workflow Example

Let's do one more complete cycle:

<instruqt-code language="bash">
# 1. MODIFY
echo "def multiply(a, b): return a * b" >> math_utils.py

# Check what changed
git status
git diff

# 2. STAGE
git add math_utils.py

# Review what will be committed
git diff --staged

# 3. COMMIT
git commit -m "Add multiply function to math_utils"

# Verify
git log --oneline -3
</instruqt-code>

## Skipping the Staging Area

For tracked files, you can skip staging with the `-a` flag:

<instruqt-code language="bash">
# Make a change
echo "# Notes" >> README.md

# Commit directly (stages all modified tracked files automatically)
git commit -a -m "Add notes section to README"
</instruqt-code>

**Caution:** This only works for *modified* files that are already tracked. New files must still be staged explicitly.

## The Staging Area's Power

The staging area might seem like extra work at first, but it gives you control that makes your Git history far more useful. You can make multiple changes throughout the day but commit them separately, each with a clear purpose. You can review changes before committing them, catching mistakes before they become part of history. You can build logical commits that tell a story, making it easy for others (and future you) to understand why changes were made. This discipline keeps your history clean and meaningful - and that matters when you're debugging or trying to understand how code evolved.
