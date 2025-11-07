# Chapter 1: Git Basics
resource "page" "what_is_git" {
  title = "What is Git?"
  file = "instructions/01_git_basics/what_is_git.md"
}

resource "page" "configuration" {
  title = "Configuration"
  file = "instructions/01_git_basics/configuration.md"

  activities = {
    "git_configured" = resource.task.git_configured
  }
}

# Chapter 2: First Repository
resource "page" "init" {
  title = "Initializing a Repository"
  file = "instructions/02_first_repository/init.md"

  activities = {
    "repo_initialized" = resource.task.repo_initialized
  }
}

resource "page" "first_commit" {
  title = "Making Your First Commit"
  file = "instructions/02_first_repository/first_commit.md"

  activities = {
    "create_readme" = resource.task.create_readme
    "stage_readme" = resource.task.stage_readme
    "first_commit" = resource.task.first_commit
  }
}

resource "page" "viewing_history" {
  title = "Viewing Commit History"
  file = "instructions/02_first_repository/viewing_history.md"
}

# Chapter 3: Working with Files
resource "page" "staging" {
  title = "Staging Changes"
  file = "instructions/03_working_with_files/staging.md"

  activities = {
    "staged_files" = resource.task.staged_files
  }
}

resource "page" "commit_workflow" {
  title = "The Commit Workflow"
  file = "instructions/03_working_with_files/commit_workflow.md"
}

resource "page" "gitignore" {
  title = "Ignoring Files"
  file = "instructions/03_working_with_files/gitignore.md"

  activities = {
    "gitignore_working" = resource.task.gitignore_working
  }
}

# Chapter 4: Understanding History
resource "page" "git_log" {
  title = "Exploring Git Log"
  file = "instructions/04_understanding_history/git_log.md"
}

resource "page" "commit_navigation" {
  title = "Navigating Commits"
  file = "instructions/04_understanding_history/commit_navigation.md"
}

resource "page" "detached_head" {
  title = "Detached HEAD State"
  file = "instructions/04_understanding_history/detached_head.md"
}

# Chapter 5: Branching Basics
resource "page" "creating_branches" {
  title = "Creating Branches"
  file = "instructions/05_branching_basics/creating_branches.md"

  activities = {
    "branch_created" = resource.task.branch_created
  }
}

resource "page" "switching_branches" {
  title = "Switching Branches"
  file = "instructions/05_branching_basics/switching_branches.md"
}

resource "page" "fast_forward_merge" {
  title = "Fast-Forward Merges"
  file = "instructions/05_branching_basics/fast_forward_merge.md"

  activities = {
    "commits_on_branch" = resource.task.commits_on_branch
    "switch_to_main" = resource.task.switch_to_main
    "branch_merged" = resource.task.branch_merged
  }
}

# Chapter 6: Merge Conflicts
resource "page" "understanding_conflicts" {
  title = "Understanding Conflicts"
  file = "instructions/06_merge_conflicts/understanding_conflicts.md"
}

resource "page" "resolving_conflicts" {
  title = "Resolving Conflicts"
  file = "instructions/06_merge_conflicts/resolving_conflicts.md"

  activities = {
    "conflict_resolved" = resource.task.conflict_resolved
  }
}

# Chapter 7: Working with Remotes
resource "page" "cloning" {
  title = "Cloning Repositories"
  file = "instructions/07_working_with_remotes/cloning.md"

  activities = {
    "remote_cloned" = resource.task.remote_cloned
  }
}

resource "page" "pushing" {
  title = "Pushing Changes"
  file = "instructions/07_working_with_remotes/pushing.md"

  activities = {
    "make_changes_for_push" = resource.task.make_changes_for_push
    "changes_pushed" = resource.task.changes_pushed
  }
}

resource "page" "pulling" {
  title = "Pulling Changes"
  file = "instructions/07_working_with_remotes/pulling.md"

  activities = {
    "changes_pulled" = resource.task.changes_pulled
  }
}

# Chapter 8: Collaboration Basics
resource "page" "multi_developer" {
  title = "Multi-Developer Workflow"
  file = "instructions/08_collaboration_basics/multi_developer.md"
}

resource "page" "conclusion" {
  title = "Conclusion"
  file = "instructions/08_collaboration_basics/conclusion.md"
}
