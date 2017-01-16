# Development box setup

## Basic development necessities

* Install Xcode command-line utilities

```
xcode-select --install
```

* [Homebrew][brew]

[brew]: http://brew.sh/

## Virtualization

* [Virtualbox][vbox]

[vbox]: https://www.virtualbox.org/wiki/Downloads

## Password Management

* [Dropbox][dropbox] (to sync 1password)
* [1password][1password] 

[dropbox]: https://www.dropbox.com/
[1password]: https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12

## Shell setup

Download and install [prezto][prezto].

[prezto]: https://github.com/sorin-ionescu/prezto

## Terminal emulator

* [iTerm2][iterm]
* Download [Hybrid][hybrid] files for iTerm2

[iterm]: http://iterm2.com/
[hybrid]: https://github.com/w0ng/vim-hybrid

## Editor

* Install Vim 8 from homebrew & copy config


```
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
git config --global core.excludesfile $PWD/.gitignore_global
git config --global color.ui true
git config --global core.editor nvim
```

## Window Manager & Hotkey Daemon

Install [khd][khd] and [kwm][kwm].

```
ln -s $PWD/.khdrc ~/.khdrc
ln -s $PWD/.kwm ~/.kwm
```

[khd]: https://github.com/koekeishiya/khd
[kwm]: https://github.com/koekeishiya/kwm
