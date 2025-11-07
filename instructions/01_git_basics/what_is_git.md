# What is Git?

Git is a **distributed version control system** that helps you track changes to your code over time. Think of it as a sophisticated "undo" system that lets you:

- Save snapshots of your project at any point
- Collaborate with others without overwriting each other's work
- Experiment with new ideas on separate branches
- Revert to previous versions if something breaks

## Key Concepts

### Repository
A repository (or "repo") is a directory that Git tracks. It contains all your project files plus a hidden `.git` directory where Git stores its history and metadata.

### Commit
A commit is a snapshot of your project at a specific point in time. Each commit has:
- A unique identifier (SHA hash)
- An author and timestamp
- A commit message describing the changes
- A pointer to the previous commit(s)

### Branch
A branch is a lightweight movable pointer to a commit. The default branch is called `main`. Branches let you work on features independently.

### Remote
A remote is a version of your repository hosted elsewhere (like on a server or another computer). In this lab, we use pre-configured remotes so you can practice collaboration without authentication setup.

## Why Git?

Git has become the industry standard for version control because:

1. **Distributed**: Everyone has a complete copy of the repository
2. **Fast**: Most operations are local and nearly instantaneous
3. **Branching**: Creating and merging branches is lightweight and efficient
4. **Integrity**: Everything is checksummed, preventing corruption
5. **Collaboration**: Multiple people can work simultaneously on the same codebase

In this lab, you'll learn Git fundamentals through hands-on practice. Let's get started!

---

**Next:** Configure your Git identity
