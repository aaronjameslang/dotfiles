if test -z "$TMUX"
then
  session_num=$(
    tmux list-sessions |
    grep -v attached |
    grep -oP '^\d+:' |
    grep -oP '^\d+' |
    head -1
  )
  if test $session_num
  then
    exec tmux attach -t $session_num
  else
    exec tmux
  fi
else
  # Hack, because tmux forgets $PATH
  . ~/.env-var
fi

. ~/.aliases
cd # hack

file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

ret_status="$(echo "${ret_status:-}" | sed 's/➜/✔/' | sed 's/➜/✘/')"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
