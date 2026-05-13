file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

ret_status="$(echo "${ret_status:-}" | sed 's/➜/✔/' | sed 's/➜/✘/')"

if which fnm
then
  eval "$(fnm env --use-on-cd)"
fi
