# Development box setup

## Password Management

* [1password][1password] 

[1password]: https://1password.com/downloads/

## File finder

```
sudo pacman -S fzf
```

## Search

* Install `ripgrep`. For use with `fzf`.

```
sudo pacman -S ripgrep
```

## Git setup

```
sudo pacman -S git
ln -s $PWD/.gitignore_global ~/.gitignore_global
ln -s $PWD/.gitconfig ~/.gitconfig
```

## Editor

* Install Vim 8 & copy config

```
sudo pacman -S vim
ln -s $PWD/.vimrc ~/.vimrc
```

* Install vim-plug.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `:PlugInstall`
