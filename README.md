## make gdb codesigin

```
$ open -a "Keychain Access.app"
```

## env setup
```
$ xcode-select --install
$ sudo xcodebuild -license accept
$ ssh-keygen -t rsa
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
