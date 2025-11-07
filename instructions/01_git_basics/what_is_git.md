# What is Git?

Git is a **distributed version control system** that helps you track changes to your code over time. Imagine working on a project for months, making hundreds of changes, and then discovering you need to undo something from three weeks ago. Without version control, you're frantically searching through backup folders (if you even made them) or resigned to starting over. With Git, you simply look at your history and restore exactly what you need.

Version control solves real problems that every developer faces. You're building a new feature when suddenly a critical bug appears in production. Git lets you save your unfinished work, switch to fixing the bug, and then return to your feature exactly where you left off. When collaborating, Git prevents the nightmare scenario where two people edit the same file and one person's work gets overwritten. It tracks who changed what, when, and why.

Think of Git as a sophisticated time machine for your code. You can save snapshots at any moment, experiment fearlessly knowing you can always go back, and collaborate with teammates without stepping on each other's toes.

## Key Concepts

### Repository

A repository (or "repo") is a directory that Git tracks. When you initialize Git in a directory, it creates a hidden `.git` folder - this is Git's database where it stores your entire project history. Everything is in there: every version of every file, every commit message, every branch. Your working files are just the current snapshot; the `.git` directory holds the complete time machine.

### Commit

A commit is a snapshot of your entire project at a specific moment. When you create a commit, Git takes a picture of all your files and stores it permanently. Each commit includes a unique identifier (a long SHA hash like `a3b7f91`), the author's identity, a timestamp, and a message describing what changed. Commits also link to their parent commits, forming a chain - this is how Git builds your project's history as a timeline of snapshots.

### Branch

A branch is a lightweight, movable pointer to a commit. Think of it as a bookmark in your commit history. The default branch is called `main`, and it simply points to your latest commit. When you create a new branch for a feature, you're creating another pointer. Both branches start at the same commit but can diverge as you add commits to one while leaving the other unchanged. This is how you can work on multiple things independently without interference.

### Remote

A remote is a version of your repository hosted elsewhere - typically on a server like GitHub or on a teammate's computer. In distributed systems like Git, there's no single "master" copy; everyone has a full repository. Remotes let you sync your work with others by pushing your commits to a shared server and pulling their commits back. In this lab, we use pre-configured remotes so you can practice collaboration without authentication setup.

## Why Git Became Essential

Git has become the industry standard for version control because it solves collaboration problems that plagued earlier systems. Older tools required a central server - if the server went down, everyone stopped working. Git is **distributed**, meaning every developer has the complete repository on their machine. Work offline, commit freely, and sync when you're ready.

Git is **fast** because most operations are local. Viewing history, creating branches, and comparing versions happen instantly - you're not waiting for network calls to a server. This speed changes how you work; you can experiment and explore history without interruption.

The **branching** model is where Git shines. Creating a branch in older systems was slow and heavyweight. In Git, branches are cheap pointers - you can create dozens to experiment, test ideas, or isolate features. This encourages trying things without fear; if an experiment fails, delete the branch and move on.

Git guarantees **integrity** through checksumming. Every file and commit has a cryptographic hash. If anything gets corrupted, Git knows immediately. You can't lose data silently or end up with inconsistent history.

Finally, Git enables true **parallel collaboration**. Multiple developers can work on the same codebase simultaneously. You're building feature A on your branch while a teammate fixes a bug on theirs. When ready, merge both back to main. No waiting for someone to "unlock" a file, no emailing zip files around.

In this lab, you'll learn Git fundamentals through hands-on practice. Let's get started!

