# Initializing a Repository

To start tracking a project with Git, you need to initialize a repository. This creates the `.git` directory where Git stores all its metadata.

## Creating a New Repository

Let's create a simple project and initialize Git:

```bash
# Create a new directory for your project
mkdir my-project
cd my-project

# Initialize Git
git init
```

You should see: `Initialized empty Git repository in /root/workspace/my-project/.git/`

## What Just Happened?

The `git init` command created a hidden `.git` directory inside your project. This directory contains:

- `objects/` - All your commits and file snapshots
- `refs/` - Branch and tag references
- `HEAD` - Points to your current branch
- `config` - Repository-specific configuration

Let's take a look:

```bash
ls -la
```

You'll see `.git` in the listing. This is Git's database for your project.

## Checking Repository Status

At any time, you can check the status of your repository:

```bash
git status
```

Right now, you'll see:

```
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

This tells you:
- You're on the `main` branch
- No commits have been made yet
- No files are ready to be committed

## Task

Initialize a Git repository in a directory called `my-project` in your workspace (`/root/workspace/`). When you've successfully initialized it, complete the task below.

<instruqt-task id="repo_initialized"></instruqt-task>

---

**Next:** Make your first commit
