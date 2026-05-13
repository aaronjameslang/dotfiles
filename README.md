# dotfiles

These are my dotfiles, organised as a monorepo of stow packages, mostly for personal use but you may find some inspiration here.

Many are out of date, almost all need better documentation.

## Structure

This repository uses GNU stow to manage dotfiles across multiple packages. Each package in the `packages/` directory can be installed independently:

- **shell** — Shell configuration files (.profile, .zshrc, .zprofile) and documentation

## Installation

To install packages on a new machine, `stow` can be used.

`stow` is available via homebrew and most other package managers.

```
mkdir ~/stow
cd ~/stow
git clone git@github.com:aaronjameslang/dotfiles.git
cd dotfiles
stow -d packages -t ~ shell
```

To install all packages:

```
stow -d packages -t ~ */
```

## Checking Status

To preview what `stow` would do without making any changes:

```
cd dotfiles
stow -n -v -d packages -t ~ shell
```

This performs a dry run (`-n`) with verbose output (`-v`),
showing which files need symlinking and any conflicts, without
modifying the filesystem.

## Linking Individual Files or Directories

To link a single file or directory without `stow`, use `ln -s`:

```
ln -s ~/stow/dotfiles/packages/shell/.zshrc ~/.zshrc
ln -s ~/stow/dotfiles/bin ~/bin
```

## Further Reading

- https://www.gnu.org/software/stow/manual/stow.html
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://onethingwell.org/post/39744163899/stow-your-dotfiles
- http://taihen.org/managing-dotfiles-with-gnu-stow/
