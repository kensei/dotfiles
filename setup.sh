#!/bin/bash
DOT_FILES=( .bashrc .gitconfig .gitignore .inputrc .screenrc .vimrc .ctags .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.vim/ $HOME/.vim

sudo gem install -n /usr/local/bin cocoapods

pod setup

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir -p develop/tools/plantuml
curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o develop/tools/plantuml/plantuml.jar

source brew-setup.sh

curl -L https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar -o $HOME/Library/android/sdk/tools/AXMLPrinter2.jar
