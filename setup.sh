#!/bin/bash
DOT_FILES=( .bashrc .gitconfig .gitignore .inputrc .screenrc .vimrc .ctags .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.vim/ $HOME/.vim

mkdir -p $HOME/develop/repos
mkdir -p $HOME/develop/workspaces

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source brew-setup.sh
source vscode.sh

curl -L https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar -o $HOME/Library/android/sdk/tools/AXMLPrinter2.jar
