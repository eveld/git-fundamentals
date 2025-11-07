# Pushing Changes

Once you've made changes to your local repository, you'll want to share them with others by **pushing** to the remote repository.

## What is Pushing?

**Pushing** uploads your local commits to a remote repository. This makes your changes available to others who have access to the remote.

## The Push Workflow

The typical workflow:
1. Make changes locally
2. Commit changes locally
3. Push commits to the remote

Only committed changes can be pushed - staged but uncommitted changes stay local.

## Making Some Changes

Let's create commits to push:

```bash
cd /root/workspace/team-project

# Create a new file
echo "# Team Project Documentation" > DOCS.md
echo "" >> DOCS.md
echo "## Getting Started" >> DOCS.md
echo "Welcome to the team project!" >> DOCS.md

# Stage and commit
git add DOCS.md
git commit -m "Add project documentation"

# Make another change
echo "This is my contribution!" > contribution.txt
git add contribution.txt
git commit -m "Add my contribution"
```

<instruqt-task id="make_changes_for_push"></instruqt-task>

Check the status:

```bash
git status
```

You'll see something like:

```
On branch main
Your branch is ahead of 'origin/main' by 2 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

Git is telling you that you have 2 commits locally that don't exist on the remote yet.

## Pushing to the Remote

Upload your commits:

```bash
git push origin main
```

Breaking this down:
- `git push` - The push command
- `origin` - The remote name (where to push)
- `main` - The branch name (what to push)

You'll see output like:

```
Counting objects: 6, done.
Delta compression done.
Writing objects: 100% (6/6), 523 bytes | 523.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0)
To /opt/git/team-project.git
   abc1234..def5678  main -> main
```

## Verifying the Push

Check status again:

```bash
git status
```

Now you'll see:

```
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

Your local branch is now synchronized with the remote!

## The Shorthand: git push

If you're on a tracking branch, you can just use:

```bash
git push
```

Git knows to push the current branch to its remote tracking branch. This works because when you clone, Git sets up tracking automatically.

## Understanding Tracking Branches

When you clone, your local `main` branch is set to track `origin/main`. This means:
- `git push` knows where to push
- `git pull` knows where to pull from
- `git status` can tell you if you're ahead or behind

Check tracking information:

```bash
git branch -vv
```

You'll see something like:

```
* main abc1234 [origin/main] Add my contribution
```

The `[origin/main]` part shows that `main` tracks `origin/main`.

## Push Rejected: Remote Has New Commits

What if someone else pushed while you were working? Let's simulate this:

First, let's create a scenario where the remote has changed. For now, just understand that if this happens, you'll see:

```
! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to '/opt/git/team-project.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. You may want to integrate the remote changes (e.g.,
hint: 'git pull ...') before pushing again.
```

This means someone else pushed commits to the remote that you don't have yet. You need to pull their changes first (we'll cover this next).

## Force Pushing (Dangerous!)

You can force push with `--force`:

```bash
git push --force origin main
```

**WARNING**: This overwrites the remote history with your history. Use this only when you know what you're doing and have coordinated with your team. Force pushing can cause others to lose work!

Common (safe) use case: You pushed something accidentally and want to undo it before anyone else pulls.

## Pushing New Branches

Push a branch that doesn't exist on the remote yet:

```bash
# Create a new branch
git checkout -b feature/new-feature

# Make a commit
echo "feature work" > feature.txt
git add feature.txt
git commit -m "Add feature"

# Push the new branch
git push origin feature/new-feature
```

Or use `-u` to set up tracking:

```bash
git push -u origin feature/new-feature
```

The `-u` flag (same as `--set-upstream`) creates the tracking relationship, so future `git push` commands know where to push.

## Viewing What Will Be Pushed

Before pushing, see what commits will be uploaded:

```bash
# Show commits that will be pushed
git log origin/main..main --oneline

# Or use the shortcut
git log @{u}.. --oneline
```

This shows commits on `main` that aren't on `origin/main` yet.

## Deleting Remote Branches

Remove a branch from the remote:

```bash
# Delete a remote branch
git push origin --delete feature/old-feature

# Alternative syntax
git push origin :feature/old-feature
```

## Best Practices for Pushing

1. **Commit first**: Only committed changes can be pushed
2. **Pull before push**: Get latest changes before pushing yours
3. **Test locally**: Make sure your code works before pushing
4. **Use meaningful commits**: Others will see your commit messages
5. **Push regularly**: Don't wait days - push completed work frequently
6. **Avoid force push**: Especially on shared branches like `main`

## Task

Make changes in your cloned repository, commit them, and push them to the remote origin. When you've successfully pushed, complete the task below.

<instruqt-task id="changes_pushed"></instruqt-task>

---

**Next:** Learn to pull changes from remotes
