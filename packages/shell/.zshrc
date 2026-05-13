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

file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

ret_status="$(echo "${ret_status:-}" | sed 's/➜/✔/' | sed 's/➜/✘/')"

if which fnm
then
  eval "$(fnm env --use-on-cd)"
fi
