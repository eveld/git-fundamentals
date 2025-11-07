# Writing Best Practices for Instruqt Labs

This document captures best practices learned while creating the Git Fundamentals lab. These guidelines help create clear, educational, and well-structured lab content.

## Leveraging the Multi-Level Structure

Instruqt's HCL format provides a powerful hierarchy:

```
Page → Task → Condition → Check
```

**Use this flexibility to create precision and clarity:**

- **Page**: A learning concept or exercise
- **Task**: A goal within that concept (can have multiple per page)
- **Condition**: A specific requirement to achieve that goal (can have multiple per task)
- **Check**: A validation script for that requirement (can have multiple per condition)

### Example: Good vs. Better Structure

**Good (single condition):**
```hcl
resource "task" "git_configured" {
  condition "configured" {
    description = "Git is properly configured"
    check { script = "scripts/check_name.sh" }
    check { script = "scripts/check_email.sh" }
  }
}
```

**Better (split conditions):**
```hcl
resource "task" "git_configured" {
  condition "name_configured" {
    description = "Git user name is configured"
    check { script = "scripts/check_name.sh" }
  }
  condition "email_configured" {
    description = "Git user email is configured"
    check { script = "scripts/check_email.sh" }
  }
}
```

The split version:
- Shows users exactly what they've accomplished
- Provides clearer progress tracking
- Makes troubleshooting easier (users know exactly which step failed)
- Is more educational (teaches discrete concepts)

## Writing Condition Descriptions

Condition descriptions are what users see in the UI. Make them count.

### Principles

1. **State accomplishments, not actions**: Describe what state has been achieved, not what to do
2. **Be specific**: Avoid vague terms like "working", "properly", "successfully"
3. **Use precise terminology**: Teach correct technical vocabulary
4. **Keep them concise**: One clear sentence

### Examples

❌ **Avoid:**
- "Git is properly configured"
- "Files are ready"
- "Branch is working"
- "Everything is set up"

✅ **Prefer:**
- "Git user name is configured"
- "README.md is in the staging area"
- "HEAD is pointing to the main branch"
- "Local main branch matches origin/main"

### More Examples

| Vague | Specific & Educational |
|-------|----------------------|
| "Repository has been initialized" | "Git repository has been initialized" |
| "Cloned directory is valid" | "team-project contains a .git directory" |
| "Changes have been pushed" | "Local commits are uploaded to origin/main" |
| "Conflict is resolved" | "Conflict markers have been removed from files" |
| "Files are staged" | "Multiple files (2 or more) are in the staging area" |

## Chronological Ordering of Conditions

**Conditions are displayed in the order you define them.** Order matters for user experience.

Arrange conditions in the chronological order users will complete them:

```hcl
# ✅ Correct chronological order
resource "task" "conflict_resolved" {
  condition "no_conflict_markers" {
    description = "Conflict markers have been removed from files"
    # Users do this FIRST - edit files to remove <<<<<<< markers
  }

  condition "merge_completed" {
    description = "Resolved files are staged and merge is committed"
    # Users do this SECOND - git add, git commit
  }
}

# ❌ Wrong order (reversed)
resource "task" "conflict_resolved" {
  condition "merge_completed" {
    # This checks for completion but users can't do it until they edit files first!
  }
  condition "no_conflict_markers" {
    # This should come first in the workflow
  }
}
```

**Ask yourself:** "What's the first thing the user needs to do? What's next? What's last?"

## Writing Instruction Content

### Remove Redundant Navigation

The Instruqt platform shows a chapter/page outline. Don't duplicate this:

❌ **Don't include:**
```markdown
---

**Next:** Learn about staging changes
```

✅ **Do:**
End pages naturally without navigation prompts. The platform handles this.

### Structure Within Pages

Use consistent structure:

1. **Concept Introduction**: Brief explanation (2-3 sentences)
2. **Key Points**: What users need to know
3. **Hands-On Section**: Step-by-step commands with explanations
4. **Task Checkpoint**: `<instruqt-task id="...">` where appropriate

### Code Examples

- Always show expected output
- Explain what commands do before showing them
- Use real, runnable examples
- Comment complex commands inline

**Example:**
```markdown
Check the status:

\`\`\`bash
git status
\`\`\`

You'll see:

\`\`\`
On branch main
Your branch is up to date with 'origin/main'.
\`\`\`

This tells you that your local and remote branches are synchronized.
```

## Writing Failure Messages

Failure messages should be **learning prompts, not answers**.

### Principles

1. **Guide, don't solve**: Help users figure it out
2. **Ask questions**: Prompt thinking
3. **Hint at concepts**: Point to what they should know
4. **Keep it conversational**: Use "you", "have you", etc.

### Examples

❌ **Too direct (gives away answer):**
```
failure_message = "Run: git config --global user.name 'Your Name'"
```

✅ **Better (guides thinking):**
```
failure_message = "Git user name is not configured. Have you set your user.name?"
```

❌ **Too vague:**
```
failure_message = "Something is wrong with your repository"
```

✅ **Better (specific hint):**
```
failure_message = "The my-project directory doesn't exist yet. Did you create it?"
```

## Task Descriptions

Task descriptions appear at the top of task cards. Make them action-oriented:

```hcl
# ✅ Good - action-oriented
description = "Verify Git configuration is set correctly"
description = "Make your first commit"
description = "Clone a repository from the remote"

# ❌ Avoid - too vague
description = "Git setup"
description = "Committing"
description = "Remotes"
```

## Splitting Tasks Appropriately

When should one page have multiple tasks vs. multiple conditions in one task?

### Use Multiple Tasks When:
- Steps are conceptually distinct learning objectives
- You want users to clearly see progress through multiple phases
- Each task represents a different Git concept

**Example:** "Making Your First Commit" page with 3 tasks:
1. `create_readme` - Creating files
2. `stage_readme` - Staging (introducing the staging area)
3. `first_commit` - Committing (introducing commits)

### Use Multiple Conditions When:
- Steps are part of accomplishing one goal
- Requirements are closely related
- They represent different aspects of the same concept

**Example:** `gitignore_working` task with 3 conditions:
1. File exists
2. File has content
3. File is committed

Both are validating "creating a working .gitignore", just different aspects.

## Progressive Complexity

Structure content to build on previous knowledge:

1. **Early labs**: Detailed guidance, more hints, explicit steps
2. **Middle labs**: Less hand-holding, expect independence
3. **Later labs**: Minimal guidance, problem-solving focus

**Example progression in failure messages:**

Chapter 2 (early):
```
"No commits found. Create a file, stage it with 'git add', and commit with 'git commit -m \"message\"'"
```

Chapter 7 (later):
```
"Your commits haven't reached the remote yet. What command sends local commits to origin?"
```

## Technical Terminology

Introduce terms properly, then use them consistently:

1. **First mention**: Explain in plain language
2. **Subsequent use**: Use the technical term
3. **Condition descriptions**: Use proper terminology (users should learn it)

**Example:**
```markdown
## The Staging Area

Before you can commit changes, you need to **stage** them. The staging area
(also called the "index") is like a preparation area for your next commit.

## Task

Add files to the staging area using `git add`.

<instruqt-task id="staged_files"></instruqt-task>
```

Task condition description:
```hcl
description = "Multiple files (2 or more) are in the staging area"
# Uses "staging area" - the term we just taught
```

## Validation Script Organization

When splitting tasks into multiple conditions with separate checks:

```
scripts/
  task_name/
    check_first_requirement.sh
    check_second_requirement.sh
    check_third_requirement.sh
```

**Don't keep old monolithic `check.sh` files** - remove them to avoid confusion about which scripts are actually used.

## Summary Checklist

When creating lab content, ask yourself:

- [ ] Are conditions ordered chronologically?
- [ ] Does each condition describe a specific accomplishment?
- [ ] Do condition descriptions use precise technical terms?
- [ ] Are failure messages hints, not answers?
- [ ] Have I leveraged the multi-level structure for clarity?
- [ ] Are complex tasks split into multiple conditions?
- [ ] Does the content build progressively on prior knowledge?
- [ ] Have I removed redundant navigation ("Next:" sections)?
- [ ] Are technical terms introduced before being used?
- [ ] Is the content educational, not just validating?

## The Golden Rule

**Every element of the structure should serve the educational goal.**

If a condition doesn't teach something specific, if a failure message doesn't prompt learning, or if the structure doesn't make the learning path clearer - revise it.

Remember: You have incredible flexibility with pages, tasks, conditions, and checks. Use it to create the clearest, most educational experience possible.
