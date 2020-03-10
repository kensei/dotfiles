# setup

## change default shell to bash

`chsh -s /bin/bash`

## make gdb codesigin

### open

```
$ open -a "Keychain Access.app"
```

### make cert

* choose menu [create a certificate...]
* create your certificate dialog
  * input name [gdb-cert]
  * select [code signing]
  * check [let me override defaults]
* certificate information dialog
  * input validity period => max day
* specify a location for the certificate dialog
  * select [system]

## env setup

```
$ xcode-select --install
$ ssh-keygen -t rsa
```

## brew setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## dotfiles setup

```
$ git clone https://github.com/kensei/dotfiles.git
$ cd dotfiles
$ ./setup.sh
```

## vim setup

```
$ mkdir ~/.vim/bundle && cd ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

vim => NeoBundleInstall
