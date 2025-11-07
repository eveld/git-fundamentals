# Git Configuration

Before using Git, you need to tell it who you are. This information is attached to every commit you make.

## Your Identity

Your Git identity has two parts:
- **Name**: Your name (or username)
- **Email**: Your email address

## Checking Current Configuration

Your Git identity has already been pre-configured for this lab, but let's verify it.

Run this command to see your configured name:

```bash
git config --global user.name
```

You should see: `Lab Student`

Now check your email:

```bash
git config --global user.email
```

You should see: `student@instruqt.lab`

## How Configuration Works

Git has three levels of configuration:

1. **System** (`--system`): Applies to all users on the system
2. **Global** (`--global`): Applies to your user account
3. **Local** (default): Applies only to the current repository

The `--global` flag means these settings apply to all repositories for your user.

## Other Useful Settings

Let's check a few other pre-configured settings:

```bash
# Default branch name
git config --global init.defaultBranch

# Default text editor
git config --global core.editor
```

The default branch is set to `main` (the modern standard), and the editor is `nano` (a beginner-friendly terminal editor).

## Viewing All Configuration

To see all your Git configuration at once:

```bash
git config --list
```

This shows every setting Git knows about.

## Task

Verify that your Git configuration is correct by running the commands above. When you're ready, check the box below to continue.

<instruqt-task id="git_configured"></instruqt-task>

---

**Next:** Create your first Git repository
