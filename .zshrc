if test -z "$TMUX"
then
  session_num=$(
    tmux list-sessions |
    grep -v attached |
    grep -oE '^\d+:' |
    grep -oE '^\d+' |
    head -1
  )
  if test $session_num
  then
    # This will error if you don't have tmux installed, and prevent your shell
    # from loading
    exec tmux attach -t $session_num
  else
    exec tmux
  fi
fi

. ~/.aliases

file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

ret_status="$(echo "${ret_status:-}" | sed 's/➜/✔/' | sed 's/➜/✘/')"

export NVM_DIR="$HOME/.nvm"

  if test -e "$NVM_DIR/nvm.sh"
then source  "$NVM_DIR/nvm.sh"  # This loads nvm
elif test -e /usr/local/opt/nvm/nvm.sh
then source  /usr/local/opt/nvm/nvm.sh
fi

if which fnm
then
  eval "$(fnm env --use-on-cd)"
fi

! test -e "$NVM_DIR/bash_completion" || source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion