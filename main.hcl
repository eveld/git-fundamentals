resource "lab" "git_fundamentals" {
  title = "Git Fundamentals"
  description = file("description.md")
  tags = ["git", "version-control", "beginner", "fundamentals"]

  settings {
    timelimit {
      duration = 90
      extend = 15
      show_timer = true
    }

    idle {
      enabled = true
      timeout = 30
      show_warning = true
    }

    controls {
      show_stop = true
    }
  }

  layout = resource.layout.terminal_instructions

  content {
    chapter "git_basics" {
      title = "Git Basics"

      page "what_is_git" {
        title = "What is Git?"
        reference = resource.page.what_is_git
      }

      page "configuration" {
        title = "Configuration"
        reference = resource.page.configuration
      }
    }

    chapter "first_repository" {
      title = "Your First Repository"

      page "init" {
        title = "Initializing a Repository"
        reference = resource.page.init
      }

      page "first_commit" {
        title = "Making Your First Commit"
        reference = resource.page.first_commit
      }

      page "viewing_history" {
        title = "Viewing Commit History"
        reference = resource.page.viewing_history
      }
    }

    chapter "working_with_files" {
      title = "Working with Files"

      page "staging" {
        title = "Staging Changes"
        reference = resource.page.staging
      }

      page "commit_workflow" {
        title = "The Commit Workflow"
        reference = resource.page.commit_workflow
      }

      page "gitignore" {
        title = "Ignoring Files"
        reference = resource.page.gitignore
      }
    }

    chapter "understanding_history" {
      title = "Understanding History"

      page "git_log" {
        title = "Exploring Git Log"
        reference = resource.page.git_log
      }

      page "commit_navigation" {
        title = "Navigating Commits"
        reference = resource.page.commit_navigation
      }

      page "detached_head" {
        title = "Detached HEAD State"
        reference = resource.page.detached_head
      }
    }

    chapter "branching_basics" {
      title = "Branching Basics"

      page "creating_branches" {
        title = "Creating Branches"
        reference = resource.page.creating_branches
      }

      page "switching_branches" {
        title = "Switching Branches"
        reference = resource.page.switching_branches
      }

      page "fast_forward_merge" {
        title = "Fast-Forward Merges"
        reference = resource.page.fast_forward_merge
      }
    }

    chapter "merge_conflicts" {
      title = "Handling Merge Conflicts"

      page "understanding_conflicts" {
        title = "Understanding Conflicts"
        reference = resource.page.understanding_conflicts
      }

      page "resolving_conflicts" {
        title = "Resolving Conflicts"
        reference = resource.page.resolving_conflicts
      }
    }

    chapter "working_with_remotes" {
      title = "Working with Remotes"

      page "cloning" {
        title = "Cloning Repositories"
        reference = resource.page.cloning
      }

      page "pushing" {
        title = "Pushing Changes"
        reference = resource.page.pushing
      }

      page "pulling" {
        title = "Pulling Changes"
        reference = resource.page.pulling
      }
    }

    chapter "collaboration_basics" {
      title = "Collaboration Basics"

      page "multi_developer" {
        title = "Multi-Developer Workflow"
        reference = resource.page.multi_developer
      }

      page "conclusion" {
        title = "Conclusion"
        reference = resource.page.conclusion
      }
    }
  }
}
