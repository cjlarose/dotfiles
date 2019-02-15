# Development box setup

## Password Management

* [1password][1password] 

[1password]: https://1password.com/downloads/

## File finder

```
brew install fzf
/usr/local/opt/fzf/install
```

## Search

```
brew install ripgrep
```

## Directory switching

```
brew install fasd
```

## Git setup

```
brew install git
ln -s $PWD/.gitignore_global ~/.gitignore_global
ln -s $PWD/.gitconfig ~/.gitconfig
```

## Editor

* Install Neovim & copy config

```
brew install neovim
ln -s $PWD/.vimrc ~/.vimrc
```

* Install vim-plug.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* Link custom plugins

```
ln -s $PWD/vim-plugins/vim-logbook ~/.vim/plugged/vim-logbook
```

Run `:PlugInstall`

* Install neovim-remote

```
pip3 install neovim-remote
```

## Shell

```
brew install zsh
ln -s $PWD/.git-mob-prompt.sh ~/.git-mob-prompt.sh
ln -s /usr/local/etc/bash_completion.d/git-prompt.sh ~/.git-prompt.sh
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases
ln -s $PWD/.zshrc ~/.zshrc
chsh -s /usr/local/bin/zsh
```
