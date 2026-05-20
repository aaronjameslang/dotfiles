.PHONY: dry-run install  uninstall

dry-run:
	stow    -n -v -d $(abspath ../..)/packages -t $(HOME) vim
	stow -D -n -v -d $(abspath ../..)/packages -t $(HOME) vim

install:
	stow    -d $(abspath ../..)/packages -t $(HOME) vim

uninstall:
	stow -D -d $(abspath ../..)/packages -t $(HOME) vim