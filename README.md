# Development box setup

## Basic development necessities

* [Homebrew][brew]

[brew]: http://brew.sh/

## Virtualization

* [Virtualbox][vbox]

[vbox]: https://www.virtualbox.org/wiki/Downloads

## Password Management

* [1password][1password] 

[1password]: https://1password.com/downloads/

## Shell setup

Download and install [prezto][prezto].

[prezto]: https://github.com/sorin-ionescu/prezto

## Terminal emulator

* [iTerm2][iterm]
* Download [Hybrid][hybrid] files for iTerm2

[iterm]: http://iterm2.com/
[hybrid]: https://github.com/w0ng/vim-hybrid

## File finder

```
brew install fzf
```

## Editor

* Install Vim 8 from homebrew & copy config

```
brew install vim
ln -s $PWD/.vimrc ~/.vimrc
```

* Install vim-plug. Remember to run `:PlugInstall`

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* Install `ag`. For use with `fzf`.

```
brew install ag
```

## Git setup

```
brew install git
ln -s $PWD/.gitignore_global ~/.gitignore_global
ln -s $PWD/.gitconfig ~/.gitconfig
```

## Window Manager & Hotkey Daemon

Install [khd][khd] and [kwm][kwm].

```
ln -s $PWD/.khdrc ~/.khdrc
ln -s $PWD/.kwm ~/.kwm
```

[khd]: https://github.com/koekeishiya/khd
[kwm]: https://github.com/koekeishiya/kwm
