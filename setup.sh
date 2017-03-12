#!/bin/bash
DOT_FILES=( .bashrc .gitconfig .gitignore .inputrc .screenrc .vimrc .ctags .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.vim/ $HOME/.vim

sudo gem install -n /usr/local/bin cocoapods

pod setup

source brew-setup.sh
