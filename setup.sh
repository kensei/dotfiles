#!/bin/bash

DOT_FILES=( .bashrc .gitconfig .gitignore .inputrc .screenrc .vimrc .ctags)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.vim/ $HOME/.vim
