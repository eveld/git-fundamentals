# Exploring Git Log

The `git log` command is your window into your project's history. When you're debugging a problem that appeared recently, you need to see what changed. When you're reviewing someone's work, you want to understand their thought process through their commits. When you're trying to find when a specific function was added or a bug was introduced, you need to search through history.

The basic `git log` shows everything, but that's often too much. With dozens or hundreds of commits, you need ways to filter, format, and search. Git log offers many options to view commits in different ways, making it a powerful tool for understanding how your code evolved. Let's explore the most useful ones.

## Basic Git Log

You've already seen the basic format:

<instruqt-code language="bash">
cd /root/workspace/my-project
git log
</instruqt-code>

This shows the full commit hash (40 characters), author name and email, date and time, and the commit message. It's comprehensive but verbose.

## Compact View

For a cleaner overview, use `--oneline`:

<instruqt-code language="bash">
git log --oneline
</instruqt-code>

This shows just the abbreviated hash (7 chars) and the first line of the commit message.

## Limiting Output

View only recent commits:

<instruqt-code language="bash">
# Show last 3 commits
git log -3

# Or with oneline format
git log --oneline -5
</instruqt-code>

## Showing Diffs

See what actually changed in each commit:

<instruqt-code language="bash">
# Show patch (diff) for each commit
git log -p

# Combine with limiting
git log -p -2
</instruqt-code>

Press `q` to exit the pager.

## Stats and Summary

Get a statistical summary of changes:

<instruqt-code language="bash">
# Show files changed and line counts
git log --stat

# Show abbreviated stats
git log --shortstat
</instruqt-code>

## Graphical View

Visualize branch structure (especially useful later when working with branches):

<instruqt-code language="bash">
git log --oneline --graph --all
</instruqt-code>

The `--graph` flag draws ASCII art showing branch relationships.

## Custom Formatting

Format output exactly how you want:

<instruqt-code language="bash">
# Custom format: hash, date, message
git log --pretty=format:"%h - %ar: %s"

# With author
git log --pretty=format:"%h - %an, %ar: %s"
</instruqt-code>

Common format placeholders include `%h` for abbreviated hash, `%H` for full hash, `%an` for author name, `%ar` for relative date (like "2 days ago"), `%ad` for absolute date, and `%s` for the commit subject (message).

## Filtering by Date

View commits from a specific time range:

<instruqt-code language="bash">
# Commits from last 2 days
git log --since="2 days ago"

# Commits before a date
git log --until="2024-11-01"

# Between dates
git log --since="2024-10-01" --until="2024-11-01"
</instruqt-code>

## Filtering by Author

See commits by a specific person:

<instruqt-code language="bash">
# Filter by author
git log --author="Lab Student"

# Can use partial matches
git log --author="Student"
</instruqt-code>

## Searching Commit Messages

Find commits mentioning specific words:

<instruqt-code language="bash">
# Search for commits with "README" in message
git log --grep="README"

# Case-insensitive search
git log --grep="readme" -i
</instruqt-code>

## Searching Code Changes

Find commits that added or removed specific text:

<instruqt-code language="bash">
# Find commits that changed occurrences of "function"
git log -S "function"

# More details with patch
git log -S "function" -p
</instruqt-code>

This is called "pickaxe" search and is useful for tracking when code was added or removed.

## Combining Options

You can combine multiple options:

<instruqt-code language="bash">
# Last 5 commits, oneline format, with graph
git log --oneline --graph -5

# Last 10 commits with stats, from last week
git log --stat -10 --since="1 week ago"
</instruqt-code>

## Practical Examples

<instruqt-code language="bash">
# Quick overview of recent work
git log --oneline -10

# Detailed view of last commit
git log -1 -p

# Who's been working on the project this week?
git log --since="1 week ago" --pretty=format:"%an: %s"

# Find all commits about tests
git log --grep="test" --oneline
</instruqt-code>


