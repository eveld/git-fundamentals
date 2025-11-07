# Ignoring Files

Not every file in your project directory should be tracked by Git. The `.gitignore` file tells Git which files and directories to ignore.

## Why Ignore Files?

Common reasons to ignore files:

- **Build artifacts**: Compiled code, binaries (e.g., `*.o`, `*.class`, `*.pyc`)
- **Dependencies**: Node modules, Python virtual environments (e.g., `node_modules/`, `venv/`)
- **OS files**: System-specific files (e.g., `.DS_Store`, `Thumbs.db`)
- **IDE settings**: Editor configuration (e.g., `.vscode/`, `.idea/`)
- **Secrets**: API keys, credentials (e.g., `.env`, `secrets.json`)
- **Temporary files**: Logs, caches (e.g., `*.log`, `tmp/`)

## Creating a .gitignore File

Let's create a `.gitignore` file:

<instruqt-code language="bash">
cd /root/workspace/my-project

# Create .gitignore
cat > .gitignore << 'EOF'
# Python bytecode
*.pyc
__pycache__/

# Virtual environments
venv/
env/

# IDE settings
.vscode/
.idea/

# OS files
.DS_Store

# Logs
*.log
EOF
</instruqt-code>

## How .gitignore Works

The `.gitignore` file uses patterns:

- `*.pyc` - Ignores all files ending in `.pyc`
- `__pycache__/` - Ignores the entire `__pycache__` directory
- `.DS_Store` - Ignores exactly this file name
- `logs/*.log` - Ignores `.log` files in the `logs/` directory
- `**/temp` - Ignores `temp` directories at any level

## Testing It Out

Let's create some files that should be ignored:

<instruqt-code language="bash">
# Create files that match our ignore patterns
touch debug.log
mkdir -p __pycache__
touch __pycache__/module.pyc
</instruqt-code>

Check Git status:

<instruqt-code language="bash">
git status
</instruqt-code>

You'll see `.gitignore` listed as untracked, but not `debug.log` or the `__pycache__` directory. Git is ignoring them!

## Committing .gitignore

The `.gitignore` file itself should be tracked:

<instruqt-code language="bash">
git add .gitignore
git commit -m "Add .gitignore for Python project"
</instruqt-code>

## Viewing Ignored Files

To see which files are being ignored:

<instruqt-code language="bash">
git status --ignored
</instruqt-code>

## When Gitignore Doesn't Work

If you already committed a file before adding it to `.gitignore`, Git will continue tracking it. To untrack it:

<instruqt-code language="bash">
# Remove from Git but keep the file
git rm --cached filename

# Commit the removal
git commit -m "Stop tracking filename"
</instruqt-code>

Now `.gitignore` will work for that file.

## Common Pitfall

If a file is already tracked by Git, adding it to `.gitignore` won't untrack it. You must explicitly remove it with `git rm --cached` first.

## Global Gitignore

You can also create a global `.gitignore` for your entire system:

<instruqt-code language="bash">
# Set up global ignore file
git config --global core.excludesfile ~/.gitignore_global

# Add OS-specific patterns
echo ".DS_Store" >> ~/.gitignore_global
</instruqt-code>

This is useful for OS or editor-specific files that you want ignored in all your projects.

## Task

Create a `.gitignore` file in your repository with at least one pattern, and commit it. When you're done, complete the task below.

<instruqt-task id="gitignore_working"></instruqt-task>

