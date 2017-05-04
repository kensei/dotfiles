#!/bin/bash

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
# brew cask install google-cloud-sdk    # require sudo
brew cask install java
(
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
)
brew cask install android-ndk
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
brew cask install xquartz               # gimp use
brew cask install gimp
brew cask install inkscape
## virtual environment
brew cask install docker
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install genymotion
## network
brew cask install wireshark
brew cask install filezilla

# app store
brew install mas
mas account | grep "Not signed in"
if [ $? -eq 0 ]; then
  echo -n "input apple id ?> "
  read INPUT
  mas signin --dialog $INPUT
fi
mas install 497799835 # Xcode
mas install 451444120 # Memory Clean
mas install 539883307 # LINE
mas install 425424353 # The Unarchiver

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
# brew install memcached                # move docker
brew install mercurial
brew install mono
# brew install mysql                    # move docker
# brew install nginx                    # move docker
brew install nkf
brew install nmap
brew install nodebrew
(
    nodebrew setup
)
brew install openssl
brew install pyenv
brew install python
brew install python3
(
    pip3 install --upgrade pip setuptools wheel
)
brew install readline
# brew install redis                    # move docker
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

# auto start docker
mkdir -p ~/Library/LaunchAgents
cat << EOS > ~/Library/LaunchAgents/com.docker.machine.default.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>EnvironmentVariables</key>
        <dict>
            <key>PATH</key>
            <string>/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin</string>
        </dict>
        <key>Label</key>
        <string>com.docker.machine.default</string>
        <key>ProgramArguments</key>
        <array>
            <string>/usr/local/bin/docker-machine</string>
            <string>start</string>
            <string>default</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
EOS

echo "setup Unity && fuze && justmind && pencil"
echo "run \$ANDROID_HOME/extras/intel/Hardware_Accelerated_Execution_Manager/IntelHAXM_{ver}.dmg"
echo "make xamarin apndroid player and setup google play(http://opengapps.org/)"
