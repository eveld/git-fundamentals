# Making Your First Commit

Now that you have a Git repository, let's create your first commit. A commit is a snapshot of your project at a specific moment - a checkpoint you can return to later.

Why three steps instead of just saving your changes directly? This workflow gives you control and precision. Imagine you've spent the afternoon working on five different files: fixing a bug, adding a feature, and updating documentation. You could throw all these changes into one commit, but that makes your history messy. Which change caused a problem later? What if you want to undo just the documentation change?

Git's three-step workflow solves this. You modify files as you work, then deliberately choose which changes form each commit. This lets you create clean, logical checkpoints in your history - one for the bug fix, one for the feature, and one for the documentation. Each commit tells a clear story about what changed and why.

## The Three-Step Workflow

Every commit follows this pattern: **Modify → Stage → Commit**. You change files in your working directory, select which changes to include in the next commit, and then create a snapshot with a descriptive message.

Let's walk through each step.

## Step 1: Create a File

First, let's create a file in your repository:

<instruqt-code language="bash">
cd /root/workspace/my-project
echo "# My Project" > README.md
</instruqt-code>

<instruqt-task id="create_readme"></instruqt-task>

Now check the status:

<instruqt-code language="bash">
git status
</instruqt-code>

You'll see:

<instruqt-code language="text">
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
</instruqt-code>

Git sees the file but isn't tracking it yet.

## Step 2: Stage the File

Staging tells Git which changes you want to include in the next commit:

<instruqt-code language="bash">
git add README.md
</instruqt-code>

<instruqt-task id="stage_readme"></instruqt-task>

Check the status again:

<instruqt-code language="bash">
git status
</instruqt-code>

Now you'll see:

<instruqt-code language="text">
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md
</instruqt-code>

The file is now **staged** and ready to be committed.

## Step 3: Commit the Changes

Create a commit with a descriptive message:

<instruqt-code language="bash">
git commit -m "Add README file"
</instruqt-code>

The `-m` flag lets you provide a commit message inline. You should see output like:

<instruqt-code language="text">
[main (root-commit) a1b2c3d] Add README file
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
</instruqt-code>

Congratulations! You've made your first commit.

## Viewing Your Commit

See your commit history:

<instruqt-code language="bash">
git log
</instruqt-code>

You'll see your commit with its unique identifier (the commit hash), your name as the author, the timestamp, and your commit message. This is the beginning of your project's timeline. Press `q` to exit the log viewer.

## Shorter Log Format

For a compact view:

<instruqt-code language="bash">
git log --oneline
</instruqt-code>

This shows just the hash and message on one line.

## Task

Create a file called `README.md` with some content, stage it with `git add`, and commit it with `git commit`. Your commit message should describe what you're committing.

<instruqt-task id="first_commit"></instruqt-task>

