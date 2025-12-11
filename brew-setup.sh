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
brew tap isen-ng/dotnet-sdk-versions # dotnet

## tool
brew install --cask amazon-music
brew install --cask appcleaner
brew install --cask bartender
brew install --cask caffeine
brew install --cask calibre
(
  curl -L https://github.com/apprenticeharper/DeDRM_tools/releases/download/v7.2.1/DeDRM_tools_7.2.1.zip -o $HOME/Downloads
)
brew install --cask claude-code
(
  brew install ccuseage # claude code
  claude config set -g autoUpdates false # use homebrew upgrade
)
brew install --cask clipy
brew install --cask dropbox
brew install --cask evernote
brew install --cask google-drive
brew install --cask keepassxc
brew install --cask openvpn-connect
brew install --cask timemachineeditor
brew install --cask the-unarchiver
## sdk
brew install --cask android-studio
brew install --cask devcontainers         # depend node
brew install --cask dotnet-sdk5
(
  ln -s $HOMEBREW_PREFIX/bin/dotnetx64 $HOMEBREW_PREFIX/bin/dotnet
  dotnet --list-sdks
)
brew install --cask google-cloud-sdk
brew install --cask android-ndk
brew install --cask unity-hub
## terminal
brew install --cask iterm2
## editor
#brew install --cask 0xed                  # binary viewer (mac binary archived)
brew install --cask sublime-text
brew install --cask marp                  # markdown presentation slide
brew install --cask hex-fiend
## ide
brew install --cask visual-studio
brew install --cask visual-studio-code
## prototyping tool
brew install --cask figma
brew install --cask origami-studio
## decompiler
brew install --cask jd-gui
brew install --cask jad
brew install --cask ilspy
# offece document
brew install --cask libreoffice
## browser
brew install --cask firefox
brew install --cask google-chrome
brew install --cask tor-browser
## graphic
brew install --cask blender
brew install --cask drawio
brew install --cask gimp
brew install --cask inkscape
brew install --cask skitch
## virtual environment
#brew install --cask docker
## network
brew install --cask wireshark
brew install --cask filezilla
## debug
brew install --cask burp-suite
brew install --cask postman
## meeting
brew install --cask zoom
brew install --cask discord
## player
brew install --cask vlc
## music
brew install --cask youtube-dl
## game
brew install --cask steam

# app store
brew install mas
mas install 497799835  # XCode
mas install 451444120  # Memory Clean
mas install 539883307  # LINE
mas install 425424353  # The Unarchiver
mas install 417375580  # BetterSnapTool
mas install 803453959  # slack
mas install 1295203466 # Microsoft Remote Desktop
mas install 784801555  # Microsoft OneNote
mas install 302584613  # kindle

# homebrew
brew install ansible
brew install ant
brew install autoconf
brew install automake
brew install awscli
brew install bash-completion
brew install binutils # gnu binary utils
brew install ctags
brew install cocoapods
(
  pod setup
)
brew install coreutils # gnu shell utils
brew install c-kermit
brew install direnv
#brew install diffutils # gnu diff utils
brew install dex2jar
brew install ffmpeg
#brew install findutils # gnu find utils
#brew install gawk # gnu awk
brew install gdb
(
  echo "set startup-with-shell off"
) > ~/.gdbinit
brew install gemini-cli
brew install git
brew install git-lfs
brew install glow # terminal markdown previwer
#brew install gnu-sed # gnu sed
#brew install gnu-tar # gnu tar
#brew install gnutls # gnu tls utils
brew install go
brew install gpg pinentry-mac
brew install gradle
brew install graphviz
#brew install grep # gnu grep (requirement tfenv
#brew install gzip # gnu gzip
brew install helm
brew install html-to-markdown
brew install hugo
brew install hyperkit
brew install ideviceinstaller
brew install ios-deploy
#brew install jenv
brew install jmeter
brew install jq
brew install libxml2 libxslt libiconv
brew install libimobiledevice
brew install lua
#brew install mercurial
brew install maven
brew install mdfried # terminal markdown previewer with image
brew install minikube
brew install mise
(
  mise plugin add flutter
  mise ls-remote flutter
  mise install flutter $(mise latest flutter)
  mise list flutter
  mise global flutter $(mise latest flutter)
  flutter doctor
  mise plugin add terraform
  mise ls-remote terraform
  mise install terraform $(mise latest terraform)
  mise list terraform
  mise global terraform $(mise latest terraform)
)
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
brew install poppler                    # pdf tools
#brew install pyenv
brew install python
brew install python3
(
  pip3 install --upgrade pip setuptools wheel
)
brew install qemu
brew install readline
brew install redis
brew install rsync
brew install screen
brew install sqlite
brew install swift-format
brew install telnet
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
