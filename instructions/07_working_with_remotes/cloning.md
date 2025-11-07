# Cloning Repositories

So far, we've worked with local Git repositories. In the real world, you'll often need to work with **remote repositories** - copies of your repository hosted elsewhere.

## What is a Remote?

A **remote** is a version of your repository hosted on another server or location. Common remote hosts include:
- GitHub
- GitLab
- Bitbucket
- Your company's internal Git server
- Another directory on your filesystem (what we'll use in this lab)

## Why Use Remotes?

Remotes enable:
- **Collaboration**: Multiple people working on the same codebase
- **Backup**: Your code is safe even if your computer dies
- **Sharing**: Distribute your code to others
- **Deployment**: Many deployment systems pull from Git remotes

## The Origin Remote

By convention, the default remote is called `origin`. When you clone a repository, Git automatically names the remote `origin`.

## Our Lab Setup

In this lab, we've pre-configured bare Git repositories in `/opt/git/`. These simulate remote servers without needing authentication.

A **bare repository** is a Git repository with no working directory - it's just the Git database. Perfect for servers!

## Cloning a Repository

Let's clone the pre-configured team project:

<instruqt-code language="bash">
cd /root/workspace

# Clone the team project
git clone /opt/git/team-project.git
</instruqt-code>

You'll see output like:

<instruqt-code language="text">
Cloning into 'team-project'...
done.
</instruqt-code>

This creates a directory called `team-project` with the repository's contents.

## What Happened?

Git did several things:
1. Created a `team-project` directory
2. Initialized a Git repository inside it
3. Copied all commits from the remote
4. Created a remote called `origin` pointing to `/opt/git/team-project.git`
5. Checked out the default branch (`main`)

## Exploring the Cloned Repository

Navigate into the cloned repository:

<instruqt-code language="bash">
cd team-project

# See the files
ls

# Check Git status
git status

# View commit history
git log --oneline
</instruqt-code>

You'll see files and commits that existed in the remote repository.

## Viewing Remotes

See what remotes are configured:

<instruqt-code language="bash">
# List remotes
git remote

# More details
git remote -v
</instruqt-code>

You'll see:

<instruqt-code language="text">
origin  /opt/git/team-project.git (fetch)
origin  /opt/git/team-project.git (push)
</instruqt-code>

`origin` is configured for both fetching (downloading) and pushing (uploading) changes.

## Understanding Remote Tracking Branches

When you clone, Git creates **remote-tracking branches**. These are local references to the state of branches on the remote.

<instruqt-code language="bash">
# See all branches including remote-tracking branches
git branch -a
</instruqt-code>

You'll see:

<instruqt-code language="text">
* main
  remotes/origin/main
</instruqt-code>

- `main` is your local branch
- `remotes/origin/main` is the remote-tracking branch showing where `main` was on `origin` when you last synchronized

## The Clone Command Syntax

<instruqt-code language="bash">
# Basic syntax
git clone <repository-url>

# Clone into a specific directory name
git clone <repository-url> <directory-name>

# Example with custom name
git clone /opt/git/team-project.git my-team-project
</instruqt-code>

## Cloning vs Creating

**Creating a new repository** (what we did before):
<instruqt-code language="bash">
mkdir myproject
cd myproject
git init
</instruqt-code>

**Cloning an existing repository**:
<instruqt-code language="bash">
git clone <url>
cd <repository-name>
# Already initialized and ready to go
</instruqt-code>

Cloning is faster when a repository already exists.

## Checking Remote Information

Get detailed information about the origin remote:

<instruqt-code language="bash">
git remote show origin
</instruqt-code>

This shows:
- Remote URL
- Which branches are tracked
- What `git push` and `git pull` will do by default

## Real-World Cloning

In real projects, you'd clone from URLs like:

<instruqt-code language="bash">
# GitHub (HTTPS)
git clone https://github.com/user/repo.git

# GitHub (SSH)
git clone git@github.com:user/repo.git

# GitLab
git clone https://gitlab.com/user/repo.git

# Company server
git clone ssh://git@company.com/repos/project.git
</instruqt-code>

We're using local paths for simplicity in this lab.

## Task

Clone the team project repository from `/opt/git/team-project.git` into your workspace directory. When you've successfully cloned it, complete the task below.

<instruqt-task id="remote_cloned"></instruqt-task>

