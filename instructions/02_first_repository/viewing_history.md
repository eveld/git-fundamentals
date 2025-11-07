# Viewing Commit History

Now that you've made your first commit, let's learn how to explore your project's history. Git provides powerful tools for viewing commits and understanding how your project has evolved.

## The Git Log

The `git log` command shows the commit history. Let's try it:

```bash
cd /root/workspace/my-project
git log
```

You'll see output like:

```
commit a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0
Author: Lab Student <student@instruqt.lab>
Date:   Thu Nov 7 14:32:15 2024 +0000

    Add README file
```

Each commit shows:
- **Commit hash**: Unique identifier (SHA-1 hash)
- **Author**: Who made the commit
- **Date**: When it was created
- **Message**: Description of the changes

Press `q` to exit the log viewer.

## Shorter Log Format

For a more compact view, use the `--oneline` flag:

```bash
git log --oneline
```

This shows just the first 7 characters of the hash and the commit message:

```
a1b2c3d Add README file
```

## Adding More Commits

Let's make a few more commits so we have more history to explore:

```bash
# Create and commit a second file
echo "print('Hello, Git!')" > hello.py
git add hello.py
git commit -m "Add hello script"

# Make another change
echo "A simple Python project" >> README.md
git add README.md
git commit -m "Update README with description"
```

Now run `git log --oneline` again. You should see three commits listed in reverse chronological order (newest first).

## Viewing Specific Commits

To see details about a specific commit, use `git show` with the commit hash:

```bash
git show HEAD
```

`HEAD` is a special reference that points to your current commit. This shows:
- The commit metadata (author, date, message)
- The actual changes (diff) introduced in that commit

## Understanding the Timeline

Git commits form a timeline, where each commit points to its parent:

```
(oldest) a1b2c3d → b2c3d4e → c3d4e5f (newest/HEAD)
```

This chain of commits is your project's history. You can always go back to any point in time.

## Key Points

- `git log` shows commit history
- `git log --oneline` provides a compact view
- `git show` displays details of a specific commit
- `HEAD` points to your current position in history
- Commits are listed newest first by default

---

**Next:** Learn about staging changes
