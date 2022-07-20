#!/bin/bash

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

sudo chown -R $(whoami):admin /opt/homebrew
sudo chmod -R g+w /opt/homebrew

# tap
brew tap rcmdnk/homebrew-rcmdnkpac # screen

## tool
brew install --cask amazon-music
brew install --cask appcleaner
brew install --cask bartender
brew install --cask caffeine
brew install --cask clipy
brew install --cask dropbox
brew install --cask evernote
brew install --cask google-drive
brew install --cask keepassx
brew install --cask openvpn-connect
brew install --cask timemachineeditor
brew install --cask the-unarchiver
brew install --cask wkhtmltopdf           # markdown => pdf
## sdk
brew install --cask android-studio
brew install --cask google-cloud-sdk
brew install --cask android-ndk
brew install --cask unity-hub
## terminal
brew install --cask iterm2
## editor
brew install --cask 0xed                  # binary viewer
brew install --cask sublime-text
brew install --cask marp                  # markdown presentation slide
## ide
brew install --cask visual-studio
brew install --cask visual-studio-code
## prototyping tool
brew intalll --cask figma
brew install --cask origami-studio
## decompiler
brew install --cask jd-gui
brew install --cask jad
## previewer
brew install --cask kindle
# offece document
brew install --cask libreoffice
## browser
brew install --cask google-chrome
brew install --cask firefox
## graphic
brew install --cask blender
brew install --cask drawio
brew install --cask gimp
brew install --cask inkscape
brew install --cask skitch
## virtual environment
brew install --cask docker
## network
brew install --cask wireshark
brew install --cask filezilla
## debug
brew install --cask postman
## meeting
brew install --cask zoom
brew install --cask discord

# app store
brew install mas
mas account | grep "Not signed in"
if [ $? -eq 0 ]; then
  echo -n "require sign in appl store"
  exit 1
fi
mas install 497799835 # Xcode
(
    sudo xcodebuild -license accept
)
mas install 451444120  # Memory Clean
mas install 539883307  # LINE
mas install 425424353  # The Unarchiver
mas install 417375580  # BetterSnapTool
mas install 803453959  # slack
mas install 1295203466 # Microsoft Remote Desktop

# homebrew
brew install ansible
brew install ant
brew install autoconf
brew install automake
brew install awscli
brew install bash-completion
brew install binutils
brew install ctags
brew install cocoapods
(
    pod setup
)
brew install coreutils
brew install gdb
(
  echo "set startup-with-shell off"
) > ~/.gdbinit
brew install c-kermit
brew install direnv
brew install dex2jar
brew install git
brew install git-lfs
brew install go
brew install gradle
brew install graphviz
brew install hyperkit
brew install ideviceinstaller
brew install ios-deploy
#brew install jenv
brew install jmeter
brew install jq
brew install libxml2 libxslt libiconv
brew install libimobiledevice
brew install lua
# brew install memcached                # move docker
brew install mercurial
brew install maven
brew install minicube
#brew install mono                      # install with in visual studio
# brew install mysql                    # move docker
brew install mysql-client
brew install netcat
# brew install nginx                    # move docker
brew install nkf
brew install nmap
#brew install nodebrew
#(
#    nodebrew setup
#)
brew install oath-toolkit
brew install openssl
brew link --force openssl
brew install pandoc
#brew install pipenv
brew install plantuml
#brew install pyenv
brew install python
brew install python3
(
    pip3 install --upgrade pip setuptools wheel
)
brew install readline
brew install redis
#brew install --HEAD -f screen
brew install rsync
brew install screenutf8 --utf8
brew install sqlite
brew install swift-format
brew install terraformer    # gcp
brew install terraforming   # aws
brew install tfenv
(
    tfenv install 0.12.24
)
brew install tree
brew install --HEAD usbmuxd
(
    brew link usbmuxd
)
brew install vim
brew install w3m
brew install wget

# clean up
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

echo "setup justmind && pencil && ps remote"
echo "run \$ANDROID_HOME/extras/intel/Hardware_Accelerated_Execution_Manager/IntelHAXM_{ver}.dmg"
echo "make xamarin apndroid player and setup google play(http://opengapps.org/)"

brew doctor
