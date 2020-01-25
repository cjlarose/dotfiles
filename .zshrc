# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/chris.larose/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# prompt
setopt prompt_subst
. /usr/local/etc/bash_completion.d/git-prompt.sh
PROMPT='%~ %F{green}$(__git_ps1 "%s ")%f$ '

# program preferences
export EDITOR=nvim
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'
export THOR_MERGE='nvr -s -d'

# aliases
alias rtest='env SEED=1337 bundle exec ruby -Itest'
alias ptest='env MYCASE__TESTING__PARALLELISM__ENABLED=1 bundle exec ruby -Itest'
alias crtest='env CHROME_DEBUG=1 SEED=1337 bundle exec ruby -Itest'
alias vim='nvim'
alias gs='git status'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# path settings
export PATH="$HOME/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.krew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH" # stack
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/llvm-9/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
