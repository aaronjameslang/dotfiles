.PHONY: install
install:
	stow -d $(abspath ../..)/packages -t $(HOME) claude

.PHONY: fix
fix:
	node .claude/settings-fix.js
