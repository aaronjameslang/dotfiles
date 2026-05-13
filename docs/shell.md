# Shell Configuration

Rather than providing one-size-fits-all shell config,
here we provide some guidance as to which config might be useful.

## Shells

### POSIX-compatible shells
These can execute POSIX/sh scripts:
- **sh** — POSIX standard (lowest common denominator)
- **bash** — widely used, adds extensions
- **zsh** — modern default on macOS, adds extensions
- **dash** — minimal POSIX shell
- **ksh** — Korn shell variant

### Non-POSIX shells
- **fish** — modern syntax, not POSIX compatible
- **PowerShell** — completely different, cross-platform

### Common shells by platform
- **Linux**: bash (default), zsh, fish
- **macOS**: zsh (default since Catalina), bash (legacy)
- **Windows**: PowerShell 7+ (cross-platform), cmd.exe (legacy)
- **BSD**: sh, bash, zsh, ksh variants

### Non-Login Shell Processes

**Login shells** are shells started with a login process (e.g., SSH session, `login` command, or your initial terminal session). They:
- Read shell initialization files to set up the environment
- Configure environment variables, PATH, and similar settings
- Should not be used for every subshell you spawn
- Are responsible for setting up your user environment

Put in **login shell profile** (`.bash_profile`, `.profile`, `.zprofile`):
- Environment variables (e.g., `EDITOR`, `LANG`)
- PATH modifications
- Exports that child shells need to inherit
- One-time setup (SSH agent, etc.)
- Anything expensive to compute

### Non-Login Shell Processes

**Non-login shells** are child shells spawned from within an existing session. They:
- Inherit environment variables from the parent shell
- Read their own RC files for interactive configuration (aliases, functions)
- Don't need to re-configure the environment
- Include interactive shells opened by scripts, terminal tabs, or commands like `bash`

Put in **RC files** (`.bashrc`, `.zshrc`):
- Aliases (interactive-only)
- Functions (shell-specific helpers)
- Prompt customization (`PS1`, colors)
- Shell options and history settings
- Tab completion settings
- Anything that only matters for interactive use

Do **not** put in RC files:
- PATH modifications (causes duplication and slow startup)
- Environment variables (should be inherited from profile)
- Expensive operations (runs every time you open a shell)

**Why it matters**: If you put configuration in `.bashrc` that should only run once (like modifying PATH), it will run every time you open a new shell and could cause performance issues or duplicate values. Configuration files need to be in the right place for the right type of shell.

**Checking shell type**: Run `shopt -q login_shell` (bash) or `[[ -o login ]] && echo "login"` (zsh) to test in your current shell.

### Profile vs RC files
- **Profile** (`.profile`, `.bash_profile`, `.zprofile`) — loaded for **login shells only**, handles environment variables and PATH
- **RC** (`.bashrc`, `.zshrc`) — loaded for **interactive non-login shells**, handles aliases and functions

### Configuration files by shell

**sh**
1. `.profile` (login shells only)

**dash**
1. `.profile` (login shells only)

**bash**
1. `.bash_profile` (login shell; sources `.profile` if it exists)
2. `.bashrc` (interactive non-login shells)

**zsh**
1. `.zprofile` (login shell; should source `.profile` to avoid duplication)
2. `.zshrc` (interactive non-login shells)

**ksh**
1. `.profile` (login shell)
2. `.kshrc` or `.ENV` (interactive shells)

**fish**
1. `~/.config/fish/config.fish` (all shells)

### Avoiding duplication
Have `.zprofile` source `.profile`:
```sh
[[ -f ~/.profile ]] && source ~/.profile
```

