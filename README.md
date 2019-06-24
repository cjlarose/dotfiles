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

* Link plugins

```
mkdir -p ~/.local/share/nvim/site/pack/plugins
ln -s $PWD/vim-plugins ~/.local/share/nvim/site/pack/plugins/start
```

* Install neovim-remote

```
pip3 install neovim-remote
```

## Shell

```
ln -s $PWD/.git-mob-prompt.sh ~/.git-mob-prompt.sh
ln -s $PWD/aliases.sh ~/aliases.sh
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_profile ~/.bash_profile
```

## asdf

Follow [official instructions][asdf] to install `asdf`.

[asdf]: https://asdf-vm.com/#/core-manage-asdf-vm

Then install plugins:

```
asdf plugin-add ruby
```

```
brew install gpg # dependency of asdf nodejs plugin
asdf plugin-add nodejs
```

Then follow [instructions][asdf-nodejs] for bootstrapping trust with gpg.

[asdf-nodejs]: https://github.com/asdf-vm/asdf-nodejs#using-a-dedicated-openpgp-keyring
