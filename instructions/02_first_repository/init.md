# Initializing a Repository

Before Git can help you track changes or collaborate with others, you need to tell it which directory to watch. This is initialization - the moment a regular directory becomes a Git repository with all the power of version control.

Think of initialization like setting up a security camera system. The cameras don't record anything until you install them and turn them on. Similarly, Git can't track your project's history until you initialize a repository. Once initialized, Git begins recording every change you choose to commit, building a complete timeline of your project's evolution.

## Creating a New Repository

Let's create a simple project and initialize Git:

<instruqt-code language="bash">
# Create a new directory for your project
mkdir my-project
cd my-project

# Initialize Git
git init
</instruqt-code>

You should see: `Initialized empty Git repository in /root/workspace/my-project/.git/`

## What Just Happened?

The `git init` command created a hidden `.git` directory inside your project. This is Git's database - its control center where it stores everything about your project's history.

Inside `.git`, you'll find several components working together: the `objects/` directory stores all your commits and file snapshots as compressed data; `refs/` keeps track of branches and tags; `HEAD` is a pointer to your current branch; and `config` holds repository-specific settings. Git maintains all this automatically - you'll rarely need to touch these files directly, but it's helpful to know they exist.

Let's take a look:

<instruqt-code language="bash">
ls -la
</instruqt-code>

You'll see `.git` in the listing. This is Git's database for your project.

## Checking Repository Status

At any time, you can check the status of your repository:

<instruqt-code language="bash">
git status
</instruqt-code>

Right now, you'll see:

<instruqt-code language="text">
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
</instruqt-code>

This tells you you're on the `main` branch, no commits have been made yet, and no files are ready to be committed. It's a blank slate, ready for you to start building your project's history.

## Task

Initialize a Git repository in a directory called `my-project` in your workspace (`/root/workspace/`). When you've successfully initialized it, complete the task below.

<instruqt-task id="repo_initialized"></instruqt-task>

