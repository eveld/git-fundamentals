# The Commit Workflow

Let's solidify your understanding of Git's core workflow: **Modify → Stage → Commit**. This cycle is fundamental to everything you'll do with Git.

## The Three-Step Cycle

Every change you make follows this pattern:

```
Working Directory  →  Staging Area  →  Repository
    (edit)              (git add)       (git commit)
```

Let's walk through a complete workflow.

## Step 1: Modify

Make changes in your working directory:

```bash
cd /root/workspace/my-project

# Modify an existing file
echo "# Project Goals" >> README.md
echo "- Learn Git fundamentals" >> README.md
echo "- Master the commit workflow" >> README.md

# Create a new file
echo "TODO: Add tests" > TODO.txt
```

Check what changed:

```bash
git status
```

You'll see:
- `README.md` listed as modified
- `TODO.txt` listed as untracked

View the specific changes:

```bash
# See what changed in modified files
git diff
```

This shows the exact lines added or removed. Press `q` to exit.

## Step 2: Stage

Select which changes to include in your next commit:

```bash
# Stage both files
git add README.md TODO.txt

# Or stage everything
# git add .
```

Check status again:

```bash
git status
```

Now both files appear under "Changes to be committed".

To see what's staged:

```bash
git diff --staged
```

This shows the changes that will be included in the next commit.

## Step 3: Commit

Create a snapshot with a descriptive message:

```bash
git commit -m "Add project goals and TODO list"
```

Verify the commit was created:

```bash
git log --oneline
```

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

```bash
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
```

## Skipping the Staging Area

For tracked files, you can skip staging with the `-a` flag:

```bash
# Make a change
echo "# Notes" >> README.md

# Commit directly (stages all modified tracked files automatically)
git commit -a -m "Add notes section to README"
```

**Caution:** This only works for *modified* files that are already tracked. New files must still be staged explicitly.

## The Staging Area's Power

The staging area might seem like extra work, but it gives you control:

- Make multiple changes, commit them separately
- Review changes before committing
- Build logical commits that tell a story
- Keep your history clean and meaningful

## Key Points

- The workflow is always: Modify → Stage → Commit
- `git diff` shows unstaged changes
- `git diff --staged` shows staged changes
- `git status` tells you where you are in the workflow
- Good commit messages make history useful
- You can commit directly with `-a` for tracked files

---

**Next:** Learn to ignore files with .gitignore
