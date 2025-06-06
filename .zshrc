# Run for interactive shells
# See https://zsh.sourceforge.io/Guide/zshguide02.html

if test -z "$TMUX"
then
  session_num=$(
    tmux list-sessions |
    grep -v attached |
    grep -oE '^[0-9]+:' |
    grep -oE '^[0-9]+' |
    head -1
  )
  if test $session_num
  then
    exec tmux attach -t $session_num
  else
    exec tmux
  fi
fi

. ~/.aliases
# cd # hack

file="$HOME/.oh-my-zsh/templates/zshrc.zsh-template"
test -f $file && source $file
file="/usr/share/oh-my-zsh/zshrc"
test -f $file && source $file

ret_status="$(echo "${ret_status:-}" | sed 's/➜/✔/' | sed 's/➜/✘/')"

#. ~/.nvm-init

# Other nvm config in ~/.zshenv
#! test -e "$NVM_DIR/bash_completion" || source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## tabtab source for serverless package
## uninstall by removing these lines or running `tabtab uninstall serverless`
#[[ -f /home/aaron/shortcake/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/aaron/shortcake/node_modules/tabtab/.completions/serverless.zsh
## tabtab source for sls package
## uninstall by removing these lines or running `tabtab uninstall sls`
#[[ -f /home/aaron/shortcake/node_modules/tabtab/.completions/sls.zsh ]] && . /home/aaron/shortcake/node_modules/tabtab/.completions/sls.zsh
## tabtab source for slss package
## uninstall by removing these lines or running `tabtab uninstall slss`
#[[ -f /home/aaron/shortcake/node_modules/tabtab/.completions/slss.zsh ]] && . /home/aaron/shortcake/node_modules/tabtab/.completions/slss.zsh
## added by travis gem
#[ -f /home/aaron/.travis/travis.sh ] && source /home/aaron/.travis/travis.sh
#
## Added by serverless binary installer
#export PATH="$HOME/.serverless/bin:$PATH"

# fnm
#export PATH=/home/aaron/.fnm:$PATH
#eval "`fnm env`"
