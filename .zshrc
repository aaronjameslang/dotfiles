. ~/.aliases
. /usr/share/oh-my-zsh/zshrc
if test "$TERM" != screen
then
  exec tmux
else
  # Hack, because tmux forgets $PATH
  . ~/.env-var
fi
