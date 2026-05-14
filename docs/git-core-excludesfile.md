# Git Core Excludesfile

The `core.excludesfile` option in git allows you to define a global `.gitignore`—a file that applies to all repositories on your machine. This is useful for ignoring files that are specific to your workflow or environment, rather than specific to a project.

## Default Behaviour

**You do not need to set `core.excludesfile` at all.** Git has a sensible default:

- **Default location**: `$XDG_CONFIG_HOME/git/ignore` (if `XDG_CONFIG_HOME` is set)
- **Fallback location**: `~/.config/git/ignore` (if `XDG_CONFIG_HOME` is not set)

If the file doesn't exist, git simply uses no global excludes. This is perfectly fine—it's not an error or misconfiguration.

## Setting a Custom Location

If you prefer a different location, you can configure it:

```bash
git config --global core.excludesfile ~/.gitignore_global
```

This writes to `~/.gitconfig` and applies to all repositories on your system.

## Per-Project vs Global Ignores

### `.gitignore` (Per-Project)

Add to per-project `.gitignore` files:
- Build artifacts (`dist/`, `build/`, `*.o`, `*.so`)
- Dependencies (`node_modules/`, `vendor/`, `__pycache__/`)
- Environment-specific files (`.env`)
- IDE/editor temporary files that are project-specific
- Generated files (compiled code, documentation builds)
- Temporary testing outputs

Example:
```
node_modules/
dist/
.env
*.log
coverage/
```

### Global Excludesfile (`core.excludesfile`)

Add to your global excludesfile:
- Editor/IDE files (`.vscode/`, `.idea/`, `*.swp`, `*.swo`, `*~`)
- OS-specific files (`.DS_Store`, `Thumbs.db`)
- Local development tools (`.envrc`, `.direnv/`)
- Personal workflow files (`.vim/`, `.emacs.d/`)
- Shell configuration artifacts
- User-specific cache/temporary files

Example `~/.config/git/ignore`:
```
# Editor/IDE
.vscode/
.idea/
*.swp
*.swo
*~
.vim/

# OS
.DS_Store
Thumbs.db

# Development tools
.direnv/
.envrc
.python-version
.nvmrc

# Shell
.zsh_history
.bash_history
```

## Why This Distinction Matters

**Per-project `.gitignore`** captures files that are irrelevant to anyone using the project, so they shouldn't be committed.

**Global excludesfile** captures files that are irrelevant to *you specifically*, keeping your repositories clean without forcing those same preferences on all collaborators.

For example: You might use Vim and want to ignore `.swp` files, but your team uses VS Code and wants to ignore `.vscode/`. Each person can have their own global excludesfile without conflicting `.gitignore` entries.

## Further Reading

- [Git Documentation: core.excludesfile](https://git-scm.com/docs/git-config#core.excludesfile)
- [Git Documentation: gitignore](https://git-scm.com/docs/gitignore)
