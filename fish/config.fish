# Program preferences
set -x EDITOR nvim
set -x LESS '--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'
set -x THOR_MERGE 'nvr -s -d'

# aliases
alias rtest='env SEED=1337 bundle exec ruby -Itest'
alias ptest='env MYCASE__TESTING__PARALLELISM__ENABLED=1 bundle exec ruby -Itest'
alias crtest='env CHROME_DEBUG=1 SEED=1337 bundle exec ruby -Itest'
alias vim='nvim'

# abbreviations
if status --is-interactive
  abbr --add -g ll ls -al
  abbr --add -g be bundle exec

  abbr --add --global gd git diff
  abbr --add --global gdc git diff --cached
  abbr --add --global gs git status
  abbr --add --global gc git commit
  abbr --add --global ga git add
  abbr --add --global gw git switch
end

# Add $HOME/bin to $PATH
set PATH "$HOME/bin" $PATH

# add ./node_modules to $PATH
set PATH ./node_modules/.bin $PATH

# asdf
source ~/.asdf/asdf.fish

# krew
set PATH ~/.krew/bin $PATH

# stack
set PATH ~/.local/bin $PATH

# cargo
set PATH ~/.cargo/bin $PATH

# llvm
set -g fish_user_paths "/usr/local/opt/llvm-9/bin" $fish_user_paths
