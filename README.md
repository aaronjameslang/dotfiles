# dotfiles

These are my dotfiles, mostly for personal use but you may find some inspiration here.

Many are out of date, almost all need better documentation.

## Installation

To install all files quickly on a new machine, `stow` can be used.

`stow` is available via homebrew and most other package managers.

```
mkdir ~/stow
cd ~/stow
git clone git@github.com:aaronjameslang/dotfiles.git
stow dotfiles
```

## Checking Status

To preview what `stow` would do without making any changes:

```
stow -n -v dotfiles
```

This performs a dry run (`-n`) with verbose output (`-v`),
showing which files need symlinking and any conflicts, without
modifying the filesystem.

## Linking Individual Files or Directories

To link a single file or directory without `stow`, use `ln -s`:

```
ln -s ~/stow/dotfiles/.vimrc ~/.vimrc
ln -s ~/stow/dotfiles/bin ~/bin
```

## Caution

I want to avoid installing these files and killing
whatever shell is being configured because of a bug in the config.
This would then be very hard to fix with a broken shell.

As such, caution is advised. This repo should probably be reorganised
so individual configs can be installed as needed, which will allow more
oversight over what is being installed.

In fact some config files would be better replaced with short guides
explaining what config is advised and why, rather than verbatim copies.

## Further Reading

- https://www.gnu.org/software/stow/manual/stow.html
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://onethingwell.org/post/39744163899/stow-your-dotfiles
- http://taihen.org/managing-dotfiles-with-gnu-stow/
