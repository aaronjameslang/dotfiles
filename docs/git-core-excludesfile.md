# Git Core Excludesfile

The `core.excludesfile` option in git allows you to define a global file that applies to all repositories on your machine. This is useful for ignoring files that are specific to your workflow or environment, rather than specific to a project.

## Per-Project vs Global Ignores

**Per-project `.gitignore`** captures files that are irrelevant to anyone using the project, so they shouldn't be committed.

**Global excludesfile** captures files that are irrelevant to *you specifically*, keeping your repositories clean without forcing those same preferences on all collaborators.

### Per-Project Exclusions (`.gitignore`)

Add to per-project `.gitignore` files:

- Build artifacts (`dist/`, `build/`, `*.o`, `*.so`)
- Dependencies (`node_modules/`, `vendor/`, `__pycache__/`)
- Environment-specific files (`.env`)
- IDE/editor temporary files that are project-specific
- Generated files (compiled code, documentation builds)
- Temporary testing outputs

### Global Excludesfile (`core.excludesfile`)

Add to your global excludesfile:

- Editor/IDE files (`.vscode/`, `.idea/`, `*.swp`, `*.swo`, `*~`)
- OS-specific files (`.DS_Store`, `Thumbs.db`)
- Personal workflow files (`.vim/`, `.emacs.d/`)
- Shell configuration artifacts
- User-specific cache/temporary files


## Recommendations

### Use Default Configuration

You do not need to set `core.excludesfile` at all. Git has a sensible default: `~/.config/git/ignore`.

Use this command to check the current value: `git config --global core.excludesfile`

If it is set, move that file to the default location, or merge it if a file already exists at that location.

Then user this command to unset the config and use default values: `git config --global --unset core.excludesfile`

### Customise your Excludes File

The contents of your excludes file will depend on your operating system, IDE, workflow etc.

If the file doesn't already exist, create it and add entries that work for you. See the examples above.

## Further Reading

- [Git Documentation: core.excludesfile](https://git-scm.com/docs/git-config#core.excludesfile)
- [Git Documentation: gitignore](https://git-scm.com/docs/gitignore)
