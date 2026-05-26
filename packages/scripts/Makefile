.PHONY: dry-run install uninstall

dry-run:
	stow    -n -v -d $(abspath ../..)/packages -t $(HOME) scripts
	stow -D -n -v -d $(abspath ../..)/packages -t $(HOME) scripts

install:
	stow    -d $(abspath ../..)/packages -t $(HOME) scripts

uninstall:
	stow -D -d $(abspath ../..)/packages -t $(HOME) scripts
