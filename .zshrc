# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

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

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Program preferences
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
PAGER=/usr/bin/less

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nvm
export NVM_DIR="/home/cjlarose/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# manually installed firefox
export PATH=/opt/firefox/bin:$PATH

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# Add nginx to PATH
export PATH=/opt/nginx/sbin:$PATH

# Open pwd in new terminals
# http://unix.stackexchange.com/a/93477
. /etc/profile.d/vte.sh

# fzf
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# send rg through pager
function rg()
{
  /usr/bin/rg -p "$@" | less -R
}

# Aliases
alias ls="ls --color"
alias ll="ls -al"
alias be="bundle exec"
alias rtest="be ruby -Itest"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias docker='sudo docker'
