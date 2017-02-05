# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# emacs mode
bindkey -e

# Completion
zstyle :compinstall filename '/home/cjlarose/.zshrc'
autoload -Uz compinit
compinit

# Prompt
autoload -Uz promptinit
promptinit
setopt PROMPT_SUBST
. ~/git-prompt.sh
PROMPT="%~ 〉"
RPROMPT=$'$(__git_ps1 "%s")'

# Program preferences
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
export NVM_DIR="/home/cjlarose/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# Open pwd in new terminals
# http://unix.stackexchange.com/a/93477
. /etc/profile.d/vte.sh

# fzf
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# Aliases
alias ls="ls --color"
alias ll="ls -al"
