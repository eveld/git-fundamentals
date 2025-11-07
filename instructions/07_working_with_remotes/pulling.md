# Pulling Changes

When working with remotes, you need to synchronize changes from the remote to your local repository. This is called **pulling**.

## What is Pulling?

**Pulling** downloads commits from a remote repository and integrates them into your local branch. It's how you get changes that others have pushed.

## Understanding Pull

`git pull` is actually a combination of two commands:
1. `git fetch` - Download commits from remote
2. `git merge` - Merge those commits into your current branch

```bash
git pull origin main
# Same as:
# git fetch origin
# git merge origin/main
```

## Simulating Remote Changes

In a real team, other developers push changes while you work. Let's simulate this by creating changes directly in the bare repository.

We'll add a commit to the remote that you don't have locally:

```bash
# Create a temporary clone to simulate another developer
cd /tmp
git clone /opt/git/team-project.git temp-clone
cd temp-clone

# Make a change as "another developer"
echo "Feature from another developer" > remote-feature.txt
git add remote-feature.txt
git commit -m "Add remote feature"

# Push to the remote
git push origin main

# Clean up
cd /root/workspace
rm -rf /tmp/temp-clone
```

Now the remote has commits you don't have locally!

## Checking for Remote Changes

See if the remote has new commits:

```bash
cd /root/workspace/team-project

# Fetch information about remote changes (doesn't merge yet)
git fetch origin

# Compare local and remote branches
git log main..origin/main --oneline
```

If this shows commits, the remote is ahead of your local branch.

## Pulling Changes

Download and integrate the remote changes:

```bash
git pull origin main
```

You'll see output like:

```
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From /opt/git/team-project
 * branch            main       -> FETCH_HEAD
   abc1234..def5678  main       -> origin/main
Updating abc1234..def5678
Fast-forward
 remote-feature.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 remote-feature.txt
```

## What Happened?

1. Git fetched new commits from `origin/main`
2. Git merged those commits into your local `main`
3. Your local branch is now up to date

Check the new file:

```bash
ls
cat remote-feature.txt
```

The file that was created remotely is now in your working directory!

## The Shorthand: git pull

If you're on a tracking branch:

```bash
git pull
```

Git knows to pull from the tracked remote branch.

## Pull with Rebase

Instead of merging, you can rebase your changes on top of the remote changes:

```bash
git pull --rebase origin main
```

This creates a cleaner, linear history. We'll cover rebasing more in advanced labs, but here's the difference:

**Regular pull (merge)**:
```
     A---B---C  (your commits)
    /         \
D---E---F-------M  (merge commit)
        ^
        (remote commits)
```

**Pull with rebase**:
```
D---E---F---A'---B'---C'  (your commits replayed on top)
        ^
        (remote commits)
```

## Handling Pull Conflicts

If you and someone else modified the same files, you might get a merge conflict:

```bash
git pull origin main
```

If there's a conflict:

```
Auto-merging somefile.txt
CONFLICT (content): Merge conflict in somefile.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Resolve it the same way we learned in the merge conflicts chapter:
1. Edit the conflicted files
2. Remove conflict markers
3. Stage the files: `git add somefile.txt`
4. Complete the merge: `git commit`

## Fetch vs Pull

**git fetch**: Downloads commits but doesn't merge

```bash
# Download remote changes
git fetch origin

# Review what changed
git log main..origin/main --oneline

# Decide to merge manually
git merge origin/main
```

**git pull**: Downloads and merges in one step

```bash
# Download and merge
git pull origin main
```

Use `fetch` when you want to review changes before integrating. Use `pull` when you trust the changes and want to integrate immediately.

## The Complete Collaboration Workflow

Here's a typical workflow when collaborating:

```bash
# 1. Start work: pull latest changes
git pull origin main

# 2. Create a feature branch
git checkout -b my-feature

# 3. Work and commit
echo "my work" > myfile.txt
git add myfile.txt
git commit -m "Add my feature"

# 4. Before pushing, get latest changes again
git checkout main
git pull origin main

# 5. Merge your feature
git merge my-feature

# 6. Push your changes
git push origin main

# 7. Clean up
git branch -d my-feature
```

## Avoiding Pull Problems

1. **Pull often**: Get changes frequently to avoid large merges
2. **Commit before pulling**: Git won't pull if you have uncommitted changes that would conflict
3. **Communicate**: Talk to your team about what you're working on
4. **Use branches**: Keep experimental work on branches

## Viewing Remote Status

Check if your branch is ahead or behind:

```bash
# See status
git status

# See exactly what's different
git log main..origin/main  # what remote has that you don't
git log origin/main..main  # what you have that remote doesn't
```

## Task

After pushing changes in the previous exercise, have the remote get ahead of your local branch (you can simulate this by adding commits via another clone), then pull those changes. When you've successfully pulled changes, complete the task below.

<instruqt-task id="changes_pulled"></instruqt-task>

---

**Next:** Practice collaboration workflows
