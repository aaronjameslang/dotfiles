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

## Further Reading

- https://www.gnu.org/software/stow/manual/stow.html
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- http://onethingwell.org/post/39744163899/stow-your-dotfiles
- http://taihen.org/managing-dotfiles-with-gnu-stow/
