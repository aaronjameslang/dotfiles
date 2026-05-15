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

## Recommendation

Less is more.

Use `zsh` and `oh-my-zsh`, don't worry about configuring other shells because you probably won't use them.

Use `.zshrc`, not `.profile` or `.zprofile`. I know there are cases
where one is better than the other, but simplicity wins here.

Having a single file `.zshrc` means you can't
misconfigure login shells or non-zsh shells, so you can use them
to recover if you manage to misconfigure `.zshrc`.

And within that file it's ideal to keep the config down to what you actually need and use. Spring clean regularly.

### What config should you have?

It's a good idea to set `$EDITOR` and `$VISUAL`.

#### `PATH`

And of course your `$PATH`. You can fill your path up
with all kinds of entries that might be useful, but honestly
just add entries as you need them, don't try to perfect it.

You might want some of these entries, depending on your setup:

```sh
  ./node_modules/.bin
  $HOME/.cargo/bin
  $HOME/.gem/ruby/*/bin
  $HOME/.local/bin
  $HOME/Library/Python/*/bin
  $HOME/bin
  $HOME/go/bin
  /opt/homebrew/bin
```

When adding entries to your path, append your custom entries to the front. Include local/relative directories first, and fallback to
user level and system level directories after that.

#### `fnm`

If you use `fnm` you might want a snippet like this:

```sh
if hash fnm
then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi
```

#### oh my zsh

By default omz will bloat your `.zshrc` with a bunch of commented out
config options. Keep it simple and delete anything that's commented out,
the defaults work fine.