# mac env

## suspend mac startup sound
sudo nvram StartupMute=%01

## finder

### don"t create .DS_Store network volume
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

### show hidden folder and file
defaults write com.apple.finder AppleShowAllFiles -bool true

### Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

### show all file extension
defaults write -g AppleShowAllExtensions -bool true

### show Library folder
chflags nohidden ~/Library

### Set `${HOME}` as the default location for new Finder windows
mkdir -p $HOME/develop
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/develop/"

### show always scrollbar
defaults write -g AppleShowScrollBars -string "Always"

### default view is listview
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

### folder first order
defaults write com.apple.finder _FXSortFoldersFirst -bool true

## network

### firewall on
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

## dock

## Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

## menu bar

### show battery persent
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

### Date options: Show the day of the week: on
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'

## mission control

### Hot corners
### Possible values:
###  0: no-op
###  2: Mission Control
###  3: Show application windows
###  4: Desktop
###  5: Start screen saver
###  6: Disable screen saver
###  7: Dashboard
### 10: Put display to sleep
### 11: Launchpad
### 12: Notification Center
### Bottom right screen corner → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

## trackpad

### Enable `Tap to click`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
### mission control gesture
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
### tap to click
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
### track speed
defaults write -g com.apple.mouse.scaling 8

## language

### os langueget to en
defaults write -g AppleLanguages -array en ja
### disable fix spell
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

### todo stop live conversion

## screen saver

### Require password immediately after the computer went into
### sleep or screen saver mode
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

### todo keybord setup
# cmd + space : input source
# shift + cmd space : reverse input source
# alt + space : spotlight
# shift + alt + space : find with finder

## keybord

### caps to ctrl
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"

killall cfprefsd
killall Finder
killall Dock
killall SystemUIServer
