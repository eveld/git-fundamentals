# Git Configuration

Every commit you make in Git includes metadata: who made it, when it was made, and what changed. Git needs to know your identity so it can record this information. When you're working with others, this attribution becomes crucial - it's how teams track who contributed what, who to ask about specific changes, and how to give credit for work.

## Why Git Needs Your Identity

Imagine looking at a project's history and seeing commits from "Unknown User" with no way to contact that person. When a bug appears in code they wrote, or when you need to understand why they made a particular decision, you're stuck. Your name and email solve this problem. They're permanently embedded in every commit you create, creating an auditable trail of who did what.

Your Git identity has two parts: a name (how you want to be known in commit history) and an email address (how others can reach you). These aren't just labels - they're used by Git hosting platforms like GitHub to link commits to user accounts, calculate contribution statistics, and enable collaboration features.

## Checking Your Configuration

Your identity has been pre-configured for this lab, but let's verify it to understand how Git stores this information.

See your configured name:

```bash
git config --global user.name
```

You should see: `Lab Student`

Check your email:

```bash
git config --global user.email
```

You should see: `student@instruqt.lab`

These commands read from Git's configuration system, which stores settings in plain text files on your computer.

## Understanding Configuration Levels

Git's configuration system has three levels, each serving a different scope. Think of them as layers of specificity: broad settings that apply everywhere, personal preferences for your account, and project-specific overrides.

The **system** level (`--system`) configures Git for every user on the machine. On a shared server, an administrator might use this to set organization-wide defaults. Most developers never touch this level.

The **global** level (`--global`) is where your personal preferences live. Settings here apply to all repositories you work on with your user account. This is where you configure your identity, preferred editor, and personal workflows. When you run `git config --global`, Git writes to a file in your home directory.

The **local** level (no flag needed) applies only to a single repository. If you contribute to an open-source project using a different email than your work projects, you'd set that at the local level. Local settings override global ones, which override system ones.

## Other Configuration

Git uses configuration for more than just identity. Let's check a couple of other settings that affect how you'll use Git:

```bash
git config --global init.defaultBranch
```

This shows `main`, the default branch name for new repositories. This is the modern standard (replacing the older `master` terminology).

```bash
git config --global core.editor
```

You'll see `nano`, which Git opens when you need to write commit messages or resolve conflicts. You can change this to your preferred editor.

Want to see everything Git knows about? Run:

```bash
git config --list
```

This dumps all configuration from all three levels. You'll see settings you didn't even know existed - Git has hundreds of options for fine-tuning its behavior.

## Task

Verify that your Git configuration is correct by running the commands above. When you're ready, check the box below to continue.

<instruqt-task id="git_configured"></instruqt-task>

