# Development box setup

## Password Management

* [1password][1password] 

[1password]: https://1password.com/downloads/

## Search

```
brew install ripgrep
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
brew install --HEAD neovim
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

Add default plugin versions

```sh
ln -s $PWD/.tool-versions ~/.tool-versions
```

## Shell

```sh
ln -s $PWD/.zshrc ~/.zshrc
chsh -s /bin/zsh
```

## File finder

```
brew install fzf
/usr/local/opt/fzf/install
```
