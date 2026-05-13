# dotfiles

These are my dotfiles, mostly for personal use but you may find some inspiration here.

Many are out of date, almost all need better documentation.

I was scared of breaking my shell/editor/etc on a new system
Originally this was a collection of files which could be installed as a unit, but I never used it this way because
by blindly copying config across.

I'm still working out what my solution for this is, but
it could look like breaking the files in to packages,
one-size-fits-all config files.
or replacing some with guides or cookbooks instead of

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

## Further Reading

- https://www.gnu.org/software/stow/manual/stow.html
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://onethingwell.org/post/39744163899/stow-your-dotfiles
- http://taihen.org/managing-dotfiles-with-gnu-stow/
