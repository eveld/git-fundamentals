# Git Fundamentals Lab - Testing Checklist

## Pre-Deployment Testing

### Configuration Validation
- [ ] Run `instruqt lab validate .` - No errors
- [ ] All HCL files parse correctly
- [ ] All file references are valid

### Container Testing
- [ ] Container builds successfully
- [ ] Git is installed and accessible
- [ ] Git version is modern (2.x)
- [ ] Setup script executes without errors
- [ ] Bare repositories created in /opt/git/
- [ ] Git identity pre-configured
- [ ] Workspace directories exist

### Task Validation Testing
Test each task check script:

- [ ] git_configured: Passes when Git is configured
- [ ] repo_initialized: Passes when repo exists
- [ ] first_commit: Passes when commit made
- [ ] staged_files: Passes when 2+ files staged
- [ ] gitignore_working: Passes when .gitignore committed
- [ ] branch_created: Passes when branch created
- [ ] branch_merged: Passes when branch merged
- [ ] conflict_resolved: Passes when conflict resolved
- [ ] remote_cloned: Passes when repo cloned
- [ ] changes_pushed: Passes when changes pushed
- [ ] changes_pulled: Passes when changes pulled

### Content Testing
- [ ] All instruction pages load correctly
- [ ] Markdown renders properly
- [ ] Code blocks are formatted correctly
- [ ] Task placeholders activate tasks
- [ ] Internal links work correctly

## Full Lab Walkthrough

Complete the lab from start to finish:

- [ ] Chapter 1: Git Basics
  - [ ] "What is Git?" page renders
  - [ ] "Configuration" page renders
  - [ ] git_configured task validates

- [ ] Chapter 2: First Repository
  - [ ] "Initializing a Repository" page renders
  - [ ] repo_initialized task validates
  - [ ] "Making Your First Commit" page renders
  - [ ] first_commit task validates
  - [ ] "Viewing Commit History" page renders

- [ ] Chapter 3: Working with Files
  - [ ] "Staging Changes" page renders
  - [ ] staged_files task validates
  - [ ] "The Commit Workflow" page renders
  - [ ] "Ignoring Files" page renders
  - [ ] gitignore_working task validates

- [ ] Chapter 4: Understanding History
  - [ ] All pages render correctly
  - [ ] Commands in examples work as shown

- [ ] Chapter 5: Branching Basics
  - [ ] branch_created task validates
  - [ ] branch_merged task validates

- [ ] Chapter 6: Merge Conflicts
  - [ ] conflict_resolved task validates
  - [ ] Conflict resolution instructions are clear

- [ ] Chapter 7: Working with Remotes
  - [ ] remote_cloned task validates
  - [ ] changes_pushed task validates
  - [ ] changes_pulled task validates

- [ ] Chapter 8: Collaboration Basics
  - [ ] All pages render correctly
  - [ ] Multi-developer scenario works

## Performance Testing
- [ ] Container starts in < 30 seconds
- [ ] Terminal is responsive
- [ ] Task validation completes in < 5 seconds
- [ ] No memory leaks or performance degradation

## Error Handling
- [ ] Helpful error messages for common mistakes
- [ ] Students can recover from errors
- [ ] Task failure messages are actionable

## Accessibility
- [ ] Instructions are clear for beginners
- [ ] No assumed prior knowledge
- [ ] Technical terms are explained

## Sign-off
- [ ] All automated tests pass
- [ ] Full walkthrough completed successfully
- [ ] No blocking issues identified
- [ ] Ready for production deployment
