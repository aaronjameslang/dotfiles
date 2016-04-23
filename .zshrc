. ~/.aliases

file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

if test -z "$TMUX"
then
  exec tmux
else
  # Hack, because tmux forgets $PATH
  . ~/.env-var
fi
