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

## Terminal & vim setup

* [iTerm2][iterm]
* Download [Solarized][solarized] files for iTerm2
* Install [neovim][neovim-install] & copy config

[iterm]: http://iterm2.com/
[solarized]: http://ethanschoonover.com/solarized
[neovim-install]: https://github.com/neovim/neovim/wiki/Installing-Neovim

```
mkdir -p ~/.config/nvim
ln -s $PWD/init.vim ~/.config/nvim/init.vim
```

* Install vim-plug. Remember to run `:PlugInstall`

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* Install `ag`. For use with `fzf`.

```
brew install ag
```

* Tmux

```
brew install tmux
cp .tmux.conf ~
```


## Git setup

```
git config --global core.excludesfile .gitignore_global
git config --global color.ui true
git config --global core.editor nvim
```
