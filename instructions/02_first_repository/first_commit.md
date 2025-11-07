# Making Your First Commit

Now that you have a Git repository, let's create your first commit. A commit is a snapshot of your project at a specific moment.

## The Three-Step Workflow

Every commit follows this pattern:

1. **Modify** - Change files in your working directory
2. **Stage** - Select which changes to include in the next commit
3. **Commit** - Create a snapshot with a descriptive message

Let's walk through each step.

## Step 1: Create a File

First, let's create a file in your repository:

```bash
cd /root/workspace/my-project
echo "# My Project" > README.md
```

<instruqt-task id="create_readme"></instruqt-task>

Now check the status:

```bash
git status
```

You'll see:

```
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
```

Git sees the file but isn't tracking it yet.

## Step 2: Stage the File

Staging tells Git which changes you want to include in the next commit:

```bash
git add README.md
```

<instruqt-task id="stage_readme"></instruqt-task>

Check the status again:

```bash
git status
```

Now you'll see:

```
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   README.md
```

The file is now **staged** and ready to be committed.

## Step 3: Commit the Changes

Create a commit with a descriptive message:

```bash
git commit -m "Add README file"
```

The `-m` flag lets you provide a commit message inline. You should see output like:

```
[main (root-commit) a1b2c3d] Add README file
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
```

Congratulations! You've made your first commit.

## Viewing Your Commit

See your commit history:

```bash
git log
```

You'll see:
- Commit hash (unique identifier)
- Author (you!)
- Date
- Commit message

Press `q` to exit the log viewer.

## Shorter Log Format

For a compact view:

```bash
git log --oneline
```

This shows just the hash and message on one line.

## Task

Create a file called `README.md` with some content, stage it with `git add`, and commit it with `git commit`. Your commit message should describe what you're committing.

<instruqt-task id="first_commit"></instruqt-task>

---

**Next:** Learn to view and navigate commit history
