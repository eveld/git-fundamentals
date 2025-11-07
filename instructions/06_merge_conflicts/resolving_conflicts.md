# Resolving Conflicts

Now that you understand what conflicts are, let's learn how to resolve them. The process is straightforward: edit the files, stage them, and commit.

## The Conflict Resolution Workflow

1. **Identify** conflicted files with `git status`
2. **Edit** the files to resolve conflicts
3. **Remove** conflict markers
4. **Stage** the resolved files with `git add`
5. **Commit** to complete the merge

## Step 1: Identify Conflicts

First, see which files have conflicts:

<instruqt-code language="bash">
git status
</instruqt-code>

Look for files marked as "both modified" under "Unmerged paths".

## Step 2: Examine the Conflict

Open the conflicted file:

<instruqt-code language="bash">
cat conflict-demo.txt
</instruqt-code>

You'll see the conflict markers:

<instruqt-code language="text">
<<<<<<< HEAD
Line 1: Modified by main
=======
Line 1: Modified by feature
>>>>>>> feature-branch
</instruqt-code>

## Step 3: Decide What to Keep

You have several options:

**Option 1: Keep your changes (HEAD)**
<instruqt-code language="text">
Line 1: Modified by main
</instruqt-code>

**Option 2: Keep their changes (incoming)**
<instruqt-code language="text">
Line 1: Modified by feature
</instruqt-code>

**Option 3: Keep both (in some order)**
<instruqt-code language="text">
Line 1: Modified by main
Line 1: Modified by feature
</instruqt-code>

**Option 4: Write something entirely new**
<instruqt-code language="text">
Line 1: Combined the best of both versions
</instruqt-code>

## Step 4: Edit the File

Let's resolve the conflict by keeping the feature branch version. Edit the file:

<instruqt-code language="bash">
# Use echo to overwrite with our chosen version
echo "Line 1: Modified by feature" > conflict-demo.txt
</instruqt-code>

Or use a text editor:

<instruqt-code language="bash">
nano conflict-demo.txt
</instruqt-code>

**Important**: Remove ALL conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and leave only the content you want.

## Step 5: Stage the Resolved File

Tell Git the conflict is resolved:

<instruqt-code language="bash">
git add conflict-demo.txt
</instruqt-code>

This marks the file as resolved.

## Step 6: Check Status

Verify the conflict is resolved:

<instruqt-code language="bash">
git status
</instruqt-code>

You should see:

<instruqt-code language="text">
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:
        modified:   conflict-demo.txt
</instruqt-code>

## Step 7: Complete the Merge

Finish the merge with a commit:

<instruqt-code language="bash">
git commit
</instruqt-code>

Git opens your editor with a pre-filled merge commit message:

<instruqt-code language="text">
Merge branch 'feature-branch' into main

# Conflicts:
#       conflict-demo.txt
</instruqt-code>

You can keep this message or modify it. Save and close the editor.

## Viewing the Result

Check the log:

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

You'll see the merge commit:

<instruqt-code language="text">
*   4567890 (HEAD -> main) Merge branch 'feature-branch' into main
|\
| * 2345678 (feature-branch) Modify line 1 in feature
* | 3456789 Modify line 1 in main
|/
* 1234567 Add conflict demo file
</instruqt-code>

Notice the merge commit has two parent commits, shown by the graph's structure.

## Using Merge Tools

Git can launch graphical merge tools to help:

<instruqt-code language="bash">
# See available tools
git mergetool --tool-help

# Launch a merge tool (if available)
git mergetool
</instruqt-code>

Common tools include: `vimdiff`, `meld`, `kdiff3`, `opendiff` (macOS).

## Aborting a Merge

If you want to give up and start over:

<instruqt-code language="bash">
git merge --abort
</instruqt-code>

This returns everything to the state before you started the merge.

## Practical Example: Multi-File Conflict

Let's resolve a more realistic scenario:

<instruqt-code language="bash">
# On main branch
git checkout main

# Create files
echo "Main version" > file1.txt
echo "Shared content" > file2.txt
git add .
git commit -m "Add files on main"

# Create feature branch
git checkout -b feature

# Modify both files
echo "Feature version" > file1.txt
echo "Feature changed this" > file2.txt
git add .
git commit -m "Modify files on feature"

# Back to main, modify differently
git checkout main
echo "Main changed this too" > file1.txt
echo "Main version" > file2.txt
git add .
git commit -m "Modify files on main"

# Attempt merge
git merge feature
</instruqt-code>

You'll have conflicts in both files. Resolve them one by one:

<instruqt-code language="bash">
# See which files conflict
git status

# Resolve file1.txt
echo "Feature version" > file1.txt
git add file1.txt

# Resolve file2.txt
echo "Feature changed this" > file2.txt
git add file2.txt

# Complete the merge
git commit
</instruqt-code>

## Tips for Resolving Conflicts

1. **Don't rush**: Take time to understand both versions
2. **Test after resolving**: Make sure the code still works
3. **Communicate**: Talk to the other developer if unclear
4. **Use tools**: Merge tools can make complex conflicts easier
5. **Keep both when unsure**: You can always refine later

## Common Mistakes

**Forgetting to remove markers**: Leaving `<<<<<<<` in your code will break it

**Not testing**: Always test your code after resolving conflicts

**Choosing randomly**: Make sure you understand what each version does

**Not staging**: The conflict isn't resolved until you `git add` the file

## Checking for Remaining Conflicts

Search for conflict markers in all files:

<instruqt-code language="bash">
git grep "<<<<<<< HEAD"
</instruqt-code>

If this returns nothing, you've cleaned up all conflicts.

## Task

Create a merge conflict by modifying the same line in a file on two different branches, then resolve the conflict and complete the merge. When you've successfully resolved the conflict, complete the task below.

<instruqt-task id="conflict_resolved"></instruqt-task>

