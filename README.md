# Development box setup

## Basic development necessities

* [Xcode][2]
* [Homebrew][3]

## Virtualization

* [Virtualbox][4]
* [Vagrant][5]

## Password Management

* [Dropbox][6] (to sync 1password)
* [1password][7] 

## Terminal & vim setup

* [iTerm2][8]
* Download [Solarized][1] files for iTerm2

Update to vim 7.4

```
brew install vim
cp .vimrc ~
```

* Download [Solarized][9] for vim

```
mkdir -p ~/.vim/colors
cd vim-colors-solarized/colors
mv solarized.vim ~/.vim/colors/
```

* Tmux

```
brew install tmux
cp .tmux.conf ~
```

## Git setup

```
cp .gitignore_global ~
git config --global core.excludesfile ~/.gitignore_global
git config --global color.ui true
```

[1]: http://ethanschoonover.com/solarized
[2]: https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12
[3]: http://brew.sh/
[4]: https://www.virtualbox.org/wiki/Downloads
[5]: http://www.vagrantup.com/
[6]: https://www.dropbox.com/
[7]: https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12
[8]: http://iterm2.com/
[9]: https://github.com/altercation/vim-colors-solarized
