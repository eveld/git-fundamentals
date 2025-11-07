# Multi-Developer Workflow

You've learned the individual pieces of Git. Now let's put it all together in a realistic multi-developer scenario.

## The Collaboration Challenge

In real projects, multiple developers work simultaneously:
- Developer A is building a feature
- Developer B is fixing a bug
- Developer C is updating documentation

Everyone needs to share their work without stepping on each other's toes. Git makes this possible.

## Simulating Two Developers

Let's simulate two developers (you and a teammate) working on the same project. We'll use two different workspace directories to represent two different computers.

## Setup: Two Work Areas

```bash
# You already have one clone in /root/workspace/team-project
# Let's create a second one representing your teammate

cd /root/workspace
git clone /opt/git/team-project.git teammate-workspace
```

Now you have:
- `/root/workspace/team-project` - Your workspace
- `/root/workspace/teammate-workspace` - Your teammate's workspace

Both connect to the same remote: `/opt/git/team-project.git`

## Scenario 1: Sequential Work

**You make changes:**

```bash
cd /root/workspace/team-project

# Create a feature file
echo "function userLogin() { /* TODO */ }" > auth.js
git add auth.js
git commit -m "Add authentication skeleton"

# Push to remote
git push origin main
```

**Your teammate pulls and builds on your work:**

```bash
cd /root/workspace/teammate-workspace

# Get your changes
git pull origin main

# See your file
ls
cat auth.js

# Add to it
echo "function userLogout() { /* TODO */ }" >> auth.js
git add auth.js
git commit -m "Add logout function"

# Push to remote
git push origin main
```

**You pull their changes:**

```bash
cd /root/workspace/team-project

# Get their changes
git pull origin main

# See the combined work
cat auth.js
```

Both functions are now in the file! This is the basic collaboration flow.

## Scenario 2: Parallel Work (No Conflicts)

**You both start from the same point:**

```bash
# Make sure both workspaces are synchronized
cd /root/workspace/team-project
git pull origin main

cd /root/workspace/teammate-workspace
git pull origin main
```

**You work on file A:**

```bash
cd /root/workspace/team-project

echo "User documentation" > USERS.md
git add USERS.md
git commit -m "Add user documentation"
git push origin main
```

**Teammate works on file B (before pulling your changes):**

```bash
cd /root/workspace/teammate-workspace

echo "Developer documentation" > DEVELOPERS.md
git add DEVELOPERS.md
git commit -m "Add developer documentation"

# Try to push
git push origin main
```

**The push is rejected!**

```
! [rejected]        main -> main (fetch first)
error: failed to push some refs
hint: Updates were rejected because the remote contains work...
```

**Teammate pulls first:**

```bash
git pull origin main
```

Git automatically merges! Since you touched different files, there's no conflict.

```bash
# Now push succeeds
git push origin main
```

**You pull the merged result:**

```bash
cd /root/workspace/team-project
git pull origin main

# Both files are here
ls
```

## Scenario 3: Parallel Work (With Conflicts)

**Both start synchronized again:**

```bash
cd /root/workspace/team-project
git pull origin main

cd /root/workspace/teammate-workspace
git pull origin main
```

**You modify README:**

```bash
cd /root/workspace/team-project

echo "Project: Team Collaboration Tool" > README.md
echo "Status: In Development" >> README.md
git add README.md
git commit -m "Update project status"
git push origin main
```

**Teammate also modifies README (different changes):**

```bash
cd /root/workspace/teammate-workspace

echo "Project: Collaboration Suite" > README.md
echo "Status: Beta Testing" >> README.md
git add README.md
git commit -m "Update project description"

# Try to push
git push origin main
# Rejected!

# Pull first
git pull origin main
```

**Conflict! Both modified README.md:**

```
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

**Teammate resolves:**

```bash
# View the conflict
cat README.md

# Resolve by keeping both contributions
cat > README.md << 'EOF'
Project: Team Collaboration Suite
Status: In Beta Testing
EOF

git add README.md
git commit -m "Merge changes to README"
git push origin main
```

**You pull the resolved version:**

```bash
cd /root/workspace/team-project
git pull origin main
cat README.md
```

## Best Practices for Team Collaboration

### 1. Pull Before You Start Working

```bash
# Start each work session with a pull
git pull origin main
```

This minimizes conflicts by keeping your local copy current.

### 2. Commit Frequently

Small, focused commits are easier to merge:

```bash
# Good: Small, focused commits
git commit -m "Add login function"
git commit -m "Add logout function"
git commit -m "Add password validation"

# Less good: One huge commit
git commit -m "Add entire authentication system"
```

### 3. Push Regularly

Don't hoard commits locally:

```bash
# Push when you've completed a logical unit of work
git push origin main
```

### 4. Communicate

Use commit messages to communicate intent:

```bash
# Clear messages help teammates understand your work
git commit -m "Fix memory leak in user session handler"
```

### 5. Use Branches for Features

Work on branches to avoid blocking others:

```bash
# Create a feature branch
git checkout -b feature/new-auth

# Work on the branch
echo "new auth code" > auth-v2.js
git add auth-v2.js
git commit -m "Implement OAuth2"

# Push your branch
git push -u origin feature/new-auth

# When ready, merge to main
git checkout main
git merge feature/new-auth
git push origin main
```

## The Golden Rule

**Always pull before you push!**

```bash
# The safe workflow
git pull origin main   # Get latest changes
# ... make your changes ...
git add .
git commit -m "Your changes"
git pull origin main   # Pull again in case someone pushed while you worked
git push origin main   # Now push
```

## Handling Race Conditions

Sometimes you and a teammate push at nearly the same time:

```bash
# You try to push
git push origin main

# Rejected! Someone just pushed

# Pull their changes
git pull origin main

# If no conflicts, push immediately
git push origin main

# If conflicts, resolve them first
```

## Real-World Team Workflow Summary

1. **Pull** - Start with latest code
2. **Branch** - Create a feature branch (optional but recommended)
3. **Work** - Make changes and commit
4. **Pull** - Get any new changes
5. **Resolve** - Fix any conflicts
6. **Test** - Make sure everything works
7. **Push** - Share your changes
8. **Merge** - Merge your branch to main (if using branches)

## Key Points

- Multiple developers can work on the same repository simultaneously
- Git handles merging automatically when changes don't conflict
- Conflicts require manual resolution
- Pull frequently to stay synchronized
- Push regularly to share your work
- Use branches for features to avoid blocking others
- Clear commit messages help team coordination

---

**Next:** Wrap up and next steps
