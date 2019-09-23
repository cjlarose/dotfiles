# Program preferences
set -x EDITOR nvim
set -x LESS '--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'
set -x THOR_MERGE 'nvr -s -d'

# aliases
alias ll='ls -al'
alias be='bundle exec'
alias rtest='env SEED=1337 bundle exec ruby -Itest'
alias ptest='env MYCASE__TESTING__PARALLELISM__ENABLED=1 SEED=1337 bundle exec ruby -Itest'
alias crtest='env CHROME_DEBUG=1 SEED=1337 bundle exec ruby -Itest'
alias vim='nvim'

# add ./node_modules to $PATH
set PATH ./node_modules/.bin $PATH

# asdf
source ~/.asdf/asdf.fish

# krew
set PATH ~/.krew/bin $PATH
