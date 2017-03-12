#!/bin/bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# tap
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap rcmdnk/homebrew-rcmdnkpac

# cask
brew cask --version
## tool
brew cask install amazon-music
brew cask install appcleaner
brew cask install bartender
brew cask install bettertouchtool
brew cask install caffeine
brew cask install dropbox
brew cask install evernote
brew cask install karabiner-elements
brew cask install keepassx
brew cask install skype
brew cask install timemachineeditor
brew cask install the-unarchiver
## sdk
brew cask install google-cloud-sdk
## terminal
brew cask install iterm2
## editor
brew cask install 0xed                  # binary viewer
brew cask install sublime-text
## ide
brew cask install netbeans-java-ee
brew cask install xamarin-studio
brew cask install xamarin-android-player
brew cask install android-studio
## decompiler
brew cask install jd-gui
brew cask install jad
## previewer
brew cask install kindle
brew cask install libreoffice
## browser
brew cask install google-chrome
brew cask install firefox
## graphic
brew cask install blender
brew cask install gimp
brew cask install inkscape
## virtual environment
brew cask install docker
brew cask install virtualbox
brew cask install virtualbox-extension-pack
## network
brew cask install wireshark
brew cask install filezilla

# app store
brew install mas
mas install 451444120 # Memory Clean
mas install 539883307 # LINE
mas install 425424353 # The Unarchiver
mas install 411246225 # Caffeine

brew install ant
brew install autoconf
brew install automake
brew install awscli
brew install bash-completion
brew install binutils
brew install ctags
brew install curl
brew install coreutils
brew install gdb
(
  echo "set startup-with-shell off"
) > ~/.gdbinit
brew install git
brew install go
brew install gradle
brew install graphviz
brew install ideviceinstaller
brew install ios-deploy
brew install jq
brew install libimobiledevice
brew install lua
brew install memcached
brew install mercurial
brew install mysql
brew install nginx
brew install nkf
brew install nmap
brew install nodebrew
brew install openssl
brew install pyenv
brew install homebrew/boneyard/pyenv-pip-rehash
brew install python
brew install python3
(
    pip3 install --upgrade pip setuptools wheel
)
brew install readline
brew install redis
#brew install --HEAD -f screen
brew install screenutf8 --utf8
brew install sqlite
brew install tree
brew install vim --with-lua --with-python3
brew install w3m
brew install wget

# clean up
brew cask cleanup
brew cleanup -s

codesign -s gdb-cert /usr/local/bin/gdb

echo "setup Unity && fuze && justmind && pencil"