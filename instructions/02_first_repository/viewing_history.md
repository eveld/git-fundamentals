# Viewing Commit History

Now that you've made your first commit, let's learn how to explore your project's history. Being able to view past commits is crucial when debugging - you need to know what changed and when. When someone reports a bug that wasn't there last week, you'll want to see what commits happened between then and now. When you're curious why a particular function exists, you can trace it back to the original commit and read the author's explanation in the commit message.

Git provides powerful tools for viewing commits and understanding how your project has evolved. Think of `git log` as your project's time machine interface - it lets you browse through history, search for specific changes, and understand the story of how your code came to be.

## The Git Log

The `git log` command shows the commit history. Let's try it:

<instruqt-code language="bash">
cd /root/workspace/my-project
git log
</instruqt-code>

You'll see output like:

<instruqt-code language="text">
commit a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0
Author: Lab Student <student@instruqt.lab>
Date:   Thu Nov 7 14:32:15 2024 +0000

    Add README file
</instruqt-code>

Each commit shows four key pieces of information: the commit hash (a unique SHA-1 identifier), the author who made the commit, the timestamp of when it was created, and the commit message describing what changed. Press `q` to exit the log viewer.

## Shorter Log Format

For a more compact view, use the `--oneline` flag:

<instruqt-code language="bash">
git log --oneline
</instruqt-code>

This shows just the first 7 characters of the hash and the commit message:

<instruqt-code language="text">
a1b2c3d Add README file
</instruqt-code>

## Adding More Commits

Let's make a few more commits so we have more history to explore:

<instruqt-code language="bash">
# Create and commit a second file
echo "print('Hello, Git!')" > hello.py
git add hello.py
git commit -m "Add hello script"

# Make another change
echo "A simple Python project" >> README.md
git add README.md
git commit -m "Update README with description"
</instruqt-code>

Now run `git log --oneline` again. You should see three commits listed in reverse chronological order (newest first).

## Viewing Specific Commits

To see details about a specific commit, use `git show` with the commit hash:

<instruqt-code language="bash">
git show HEAD
</instruqt-code>

`HEAD` is a special reference that points to your current commit. This shows:
- The commit metadata (author, date, message)
- The actual changes (diff) introduced in that commit

## Understanding the Timeline

Git commits form a timeline, where each commit points to its parent:

<instruqt-code language="text">
(oldest) a1b2c3d → b2c3d4e → c3d4e5f (newest/HEAD)
</instruqt-code>

This chain of commits is your project's history. You can always go back to any point in time.


