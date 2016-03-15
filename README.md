# Development box setup

## Basic development necessities

* [Xcode][xcode]
* [Homebrew][brew]

[xcode]: https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12
[brew]: http://brew.sh/

## Virtualization

* [Virtualbox][vbox]

[vbox]: https://www.virtualbox.org/wiki/Downloads

## Password Management

* [Dropbox][dropbox] (to sync 1password)
* [1password][1password] 

[dropbox]: https://www.dropbox.com/
[1password]: https://itunes.apple.com/us/app/1password-password-manager/id443987910?mt=12

## Terminal & vim setup

* [iTerm2][iterm]
* Download [Solarized][solarized] files for iTerm2
* Install [neovim][neovim-install] & copy config

[iterm]: http://iterm2.com/
[solarized]: http://ethanschoonover.com/solarized
[neovim-install]: https://github.com/neovim/neovim/wiki/Installing-Neovim<Paste>

    mkdir -p ~/.config/nvim
    cp .vimrc ~/.config/nvim

* Tmux

    brew install tmux
    cp .tmux.conf ~

## Git setup

    cp .gitignore_global ~
    git config --global core.excludesfile ~/.gitignore_global
    git config --global color.ui true
    git config --global core.editor vim
