# Navigating Commits

Git provides special notation for referring to commits relative to other commits. This makes it easy to explore your history without memorizing long commit hashes.

## Understanding HEAD

`HEAD` is a pointer to your current location in the Git history. Most of the time, it points to the tip of your current branch.

Check where HEAD points:

```bash
cd /root/workspace/my-project

# Show current commit
git log --oneline -1
```

The commit shown is where HEAD is pointing.

## Relative References

Instead of using full commit hashes, you can use relative notation:

### The Tilde (~)

`~` means "the parent of". You can chain them:

- `HEAD~` or `HEAD~1` - One commit before HEAD (parent)
- `HEAD~2` - Two commits before HEAD (grandparent)
- `HEAD~3` - Three commits before HEAD (great-grandparent)

### The Caret (^)

`^` also means parent, but is useful when commits have multiple parents (merges):

- `HEAD^` - Same as `HEAD~1`
- `HEAD^2` - The second parent (only for merge commits)

For now, `~` and `^` are mostly interchangeable since we haven't worked with merges yet.

## Viewing Previous Commits

Show details about earlier commits:

```bash
# Show commit before HEAD
git show HEAD~1

# Show commit two back
git show HEAD~2

# Just show the message
git log --oneline -1 HEAD~1
```

## Comparing Commits

See what changed between commits:

```bash
# Changes between HEAD and previous commit
git diff HEAD~1

# Changes between two specific points
git diff HEAD~3 HEAD~1

# Changes in the last commit
git diff HEAD~1 HEAD
```

Or use the shorthand:

```bash
# Same as: git diff HEAD~1 HEAD
git diff HEAD~1..HEAD
```

## Using Commit Hashes

You can also reference commits by their hash:

```bash
# Show any commit by hash
git show a1b2c3d

# Only need enough characters to be unique (usually 7)
git show a1b2c3d
```

Get the hash from `git log --oneline`.

## Checking Out Previous Versions

You can view your files as they were at any commit:

```bash
# View file as it was 3 commits ago
git show HEAD~3:README.md

# View file from specific commit
git show a1b2c3d:README.md
```

This doesn't change your files, just shows their past content.

## Branch References

You can reference the tip of any branch:

```bash
# Show latest commit on main
git show main

# Show previous commit on main
git show main~1
```

## Practical Examples

```bash
# What did I change in my last commit?
git diff HEAD~1 HEAD

# What was the commit message 3 commits ago?
git log --oneline -1 HEAD~3

# Show the state of a file 2 commits back
git show HEAD~2:hello.py

# Compare current version to 5 commits ago
git diff HEAD~5 hello.py
```

## The Reflog

Git keeps a log of where HEAD has been:

```bash
git reflog
```

This shows every place HEAD has pointed, even if commits aren't in the current branch history. It's useful for recovering "lost" commits (we'll cover this more in advanced topics).

## Relative Reference Cheat Sheet

| Notation | Meaning |
|----------|---------|
| `HEAD` | Current commit |
| `HEAD~1` or `HEAD~` | Parent commit |
| `HEAD~2` | Grandparent commit |
| `HEAD~n` | n commits back |
| `HEAD^` | First parent (same as `HEAD~1`) |
| `HEAD^2` | Second parent (merge commits only) |
| `main` | Tip of main branch |
| `main~3` | Three commits back on main |
| `a1b2c3d` | Specific commit by hash |

## Key Points

- `HEAD` points to your current commit
- `~` lets you reference parent commits (HEAD~1, HEAD~2, etc.)
- You don't need full hashes, abbreviated versions work fine
- `git show` displays commit details and changes
- `git diff` compares any two commits
- Relative references make navigation easy without memorizing hashes

---

**Next:** Understanding detached HEAD state
