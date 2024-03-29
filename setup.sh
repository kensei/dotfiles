#!/bin/bash
DOT_FILES=( .bashrc .gitconfig .gitignore .inputrc .screenrc .vimrc .ctags .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.vim/ $HOME/.vim

mkdir -p $HOME/develop/repos
mkdir -p $HOME/develop/workspaces

source macenv-setup.sh

if [ -f /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval “$(/opt/homebrew/bin/brew shellenv)”

source brew-setup.sh
source vscode.sh

cuol -L https://desktop.docker.com/mac/main/arm64/Docker.dmg -o $HOME/Downloads/Docker.dmg
open $HOME/Downloads/Docker.dmg

mkdir -p $HOME/Library/android/sdk/tools/
curl -L https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar -o $HOME/Library/android/sdk/tools/AXMLPrinter2.jar
