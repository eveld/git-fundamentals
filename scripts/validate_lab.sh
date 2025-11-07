#!/bin/bash
# Lab validation script - run this to check lab configuration

set -e

echo "Validating Git Fundamentals Lab..."

# Check HCL syntax
echo "✓ Validating HCL files..."
instruqt lab validate /Users/erik/code/instruqt/labs/git/git-fundamentals

# Check all instruction files exist
echo "✓ Checking instruction files..."
for chapter in 01_git_basics 02_first_repository 03_working_with_files 04_understanding_history 05_branching_basics 06_merge_conflicts 07_working_with_remotes 08_collaboration_basics; do
  if [ ! -d "instructions/$chapter" ]; then
    echo "  ✗ Missing directory: instructions/$chapter"
    exit 1
  fi
done

# Check all check scripts exist and are executable
echo "✓ Checking validation scripts..."
for script in git_configured repo_initialized first_commit staged_files gitignore_working branch_created branch_merged conflict_resolved remote_cloned changes_pushed changes_pulled; do
  if [ ! -f "scripts/$script/check.sh" ]; then
    echo "  ✗ Missing check script: scripts/$script/check.sh"
    exit 1
  fi
  if [ ! -x "scripts/$script/check.sh" ]; then
    echo "  ✗ Check script not executable: scripts/$script/check.sh"
    chmod +x "scripts/$script/check.sh"
  fi
done

# Check setup scripts exist and are executable
echo "✓ Checking setup scripts..."
for script in install_packages.sh configure_git.sh; do
  if [ ! -f "scripts/setup/$script" ]; then
    echo "  ✗ Missing setup script: scripts/setup/$script"
    exit 1
  fi
  if [ ! -x "scripts/setup/$script" ]; then
    chmod +x "scripts/setup/$script"
  fi
done

echo ""
echo "✅ All validation checks passed!"
echo ""
echo "Next steps:"
echo "1. Test the lab locally if possible"
echo "2. Deploy to Instruqt staging environment"
echo "3. Complete full lab walkthrough manually"
echo "4. Fix any issues discovered"
echo "5. Deploy to production"
