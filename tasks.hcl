# Task: Git Configured
resource "task" "git_configured" {
  description = "Verify Git configuration is set correctly"

  config {
    target = resource.container.git_workstation
  }

  condition "name_configured" {
    description = "Git user name is configured"

    check {
      script = "scripts/git_configured/check_name.sh"
      failure_message = "Git user name is not configured. Have you set your user.name?"
    }
  }

  condition "email_configured" {
    description = "Git user email is configured"

    check {
      script = "scripts/git_configured/check_email.sh"
      failure_message = "Git user email is not configured. Have you set your user.email?"
    }
  }
}

# Task: Repository Initialized
resource "task" "repo_initialized" {
  description = "Initialize a Git repository in /root/workspace/my-project"

  config {
    target = resource.container.git_workstation
  }

  condition "directory_exists" {
    description = "Project directory exists"

    check {
      script = "scripts/repo_initialized/check_directory.sh"
      failure_message = "The my-project directory doesn't exist yet. Did you create it?"
    }
  }

  condition "git_initialized" {
    description = "Git repository has been initialized"

    check {
      script = "scripts/repo_initialized/check_git_init.sh"
      failure_message = "Git repository not initialized. Have you run the init command in the correct directory?"
    }
  }
}

# Task: Create README
resource "task" "create_readme" {
  description = "Create a README.md file"

  config {
    target = resource.container.git_workstation
  }

  condition "readme_exists" {
    description = "README.md file exists in the working directory"

    check {
      script = "scripts/create_readme/check_file_exists.sh"
      failure_message = "README.md file not found. Have you created it in the right location?"
    }
  }
}

# Task: Stage README
resource "task" "stage_readme" {
  description = "Stage the README.md file"

  config {
    target = resource.container.git_workstation
  }

  condition "readme_staged" {
    description = "README.md is in the staging area"

    check {
      script = "scripts/stage_readme/check_staged.sh"
      failure_message = "README.md is not staged. Have you used the add command?"
    }
  }
}

# Task: First Commit
resource "task" "first_commit" {
  description = "Make your first commit"

  config {
    target = resource.container.git_workstation
  }

  condition "commit_exists" {
    description = "At least one commit exists in the repository"

    check {
      script = "scripts/first_commit/check_commit.sh"
      failure_message = "No commits found yet. Have you created a commit with a message?"
    }

    solve {
      script = "scripts/first_commit/solve.sh"
    }
  }
}

# Task: Files Staged
resource "task" "staged_files" {
  description = "Practice staging multiple files"

  config {
    target = resource.container.git_workstation
  }

  condition "multiple_files_staged" {
    description = "Multiple files (2 or more) are in the staging area"

    check {
      script = "scripts/staged_files/check.sh"
      failure_message = "Not enough files are staged. You need at least 2 files in the staging area."
    }
  }
}

# Task: Gitignore Working
resource "task" "gitignore_working" {
  description = "Create a .gitignore file to exclude files from Git"

  config {
    target = resource.container.git_workstation
  }

  condition "gitignore_exists" {
    description = ".gitignore file exists"

    check {
      script = "scripts/gitignore_working/check_exists.sh"
      failure_message = "No .gitignore file found. Have you created one?"
    }
  }

  condition "gitignore_has_content" {
    description = ".gitignore file contains at least one pattern"

    check {
      script = "scripts/gitignore_working/check_content.sh"
      failure_message = "The .gitignore file is empty. What patterns do you want to ignore?"
    }
  }

  condition "gitignore_committed" {
    description = ".gitignore file is tracked and committed"

    check {
      script = "scripts/gitignore_working/check_committed.sh"
      failure_message = "The .gitignore file is not committed yet. Should it be tracked by Git?"
    }
  }
}

# Task: Branch Created
resource "task" "branch_created" {
  description = "Create a new branch for feature development"

  config {
    target = resource.container.git_workstation
  }

  condition "branch_exists" {
    description = "At least one branch exists besides main"

    check {
      script = "scripts/branch_created/check.sh"
      failure_message = "No new branch found. Have you created one besides main?"
    }
  }
}

# Task: Commits on Branch
resource "task" "commits_on_branch" {
  description = "Make commits on your feature branch"

  config {
    target = resource.container.git_workstation
  }

  condition "commits_made" {
    description = "At least one commit exists on the feature branch"

    check {
      script = "scripts/commits_on_branch/check_commits.sh"
      failure_message = "No commits found on your feature branch. Are you on the right branch?"
    }
  }
}

# Task: Switch to Main
resource "task" "switch_to_main" {
  description = "Switch back to the main branch"

  config {
    target = resource.container.git_workstation
  }

  condition "on_main" {
    description = "HEAD is pointing to the main branch"

    check {
      script = "scripts/branch_merged/check_on_main.sh"
      failure_message = "You're not on the main branch. How do you switch branches?"
    }
  }
}

# Task: Branch Merged
resource "task" "branch_merged" {
  description = "Merge your feature branch into main"

  config {
    target = resource.container.git_workstation
  }

  condition "branch_merged" {
    description = "Feature branch commits are now part of main branch history"

    check {
      script = "scripts/branch_merged/check_merged.sh"
      failure_message = "The branches haven't been merged yet. What command brings changes from one branch to another?"
    }
  }
}

# Task: Conflict Resolved
resource "task" "conflict_resolved" {
  description = "Resolve a merge conflict"

  config {
    target = resource.container.git_workstation
  }

  condition "no_conflict_markers" {
    description = "Conflict markers have been removed from files"

    check {
      script = "scripts/conflict_resolved/check_no_markers.sh"
      failure_message = "Conflict markers are still present in your files. Have you edited them to choose what to keep?"
    }
  }

  condition "merge_completed" {
    description = "Resolved files are staged and merge is committed"

    check {
      script = "scripts/conflict_resolved/check_no_merge.sh"
      failure_message = "The merge is still in progress. Have you staged the resolved files and completed the merge?"
    }
  }
}

# Task: Remote Cloned
resource "task" "remote_cloned" {
  description = "Clone a repository from the remote"

  config {
    target = resource.container.git_workstation
  }

  condition "clone_directory_exists" {
    description = "team-project directory exists in workspace"

    check {
      script = "scripts/remote_cloned/check_directory.sh"
      failure_message = "The team-project directory doesn't exist. Have you cloned the repository?"
    }
  }

  condition "clone_is_git_repo" {
    description = "team-project contains a .git directory"

    check {
      script = "scripts/remote_cloned/check_git_repo.sh"
      failure_message = "The team-project directory exists but isn't a Git repository. Did you use the clone command?"
    }
  }

  condition "origin_configured" {
    description = "origin remote points to the source repository"

    check {
      script = "scripts/remote_cloned/check_origin.sh"
      failure_message = "No origin remote is configured. Cloning should set this up automatically."
    }
  }
}

# Task: Make Changes in Clone
resource "task" "make_changes_for_push" {
  description = "Make changes in the cloned repository"

  config {
    target = resource.container.git_workstation
  }

  condition "changes_made" {
    description = "New commits exist in the local repository"

    check {
      script = "scripts/make_changes_for_push/check_new_commit.sh"
      failure_message = "No new commits found. Have you made changes and committed them in team-project?"
    }
  }
}

# Task: Changes Pushed
resource "task" "changes_pushed" {
  description = "Push your commits to the remote repository"

  config {
    target = resource.container.git_workstation
  }

  condition "changes_pushed" {
    description = "Local commits are uploaded to origin/main"

    check {
      script = "scripts/changes_pushed/check.sh"
      failure_message = "Your commits haven't reached the remote yet. What command sends local commits to origin?"
    }
  }
}

# Task: Changes Pulled
resource "task" "changes_pulled" {
  description = "Pull changes from the remote repository"

  config {
    target = resource.container.git_workstation
  }

  condition "changes_pulled" {
    description = "Local main branch matches origin/main"

    check {
      script = "scripts/changes_pulled/check.sh"
      failure_message = "Your local branch is behind the remote. What command fetches and merges remote changes?"
    }
  }
}
