# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="/Users/cjlarose/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# MySQL 5.6
export PATH=/usr/local/opt/mysql\@5.6/bin:$PATH

# Add node_modules to path
export PATH=./node_modules/.bin:$PATH

# Editor config
export EDITOR=vim

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bash completion from brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
