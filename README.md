# Development box setup

## Password Management

* [1password][1password] 

[1password]: https://1password.com/downloads/

## File finder

```
sudo pacman -S fzf
```

## Search

```
sudo pacman -S ripgrep
```

## Clipboard management

```
sudo pacman -S xsel
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

## Window manager

```
mkdir -p ~/.config/i3
ln -s $PWD/i3.conf ~/.config/i3/config
sudo pacman -S i3
```

## Shell

```
sudo pacman -S zsh zsh-completions
cp /usr/share/git/completion/git-prompt.sh ~/.git-prompt.sh
ln -s $PWD/.zshrc-aliases ~/.zshrc-aliases
ln -s $PWD/.zshrc ~/.zshrc
chsh -s /usr/bin/zsh
```

## Terminal Emulator

```
sudo pacman -S rxvt-unicode
ln -s $PWD/.Xdefaults ~/.Xdefaults
```

## Fonts

```
sudo pacman -S ttf-dejavu ttf-symbola
```
