# finder

## don"t create .DS_Store network volume
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## show hidden folder and file
defaults write com.apple.finder AppleShowAllFiles -bool true

## Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

## show all file extension
defaults write -g AppleShowAllExtensions -bool true

## show Library folder
chflags nohidden ~/Library

# dock

## Automatically hide or show the Dock
defaults write com.apple.dock autohide -bool true

# menu bar

## show battery persent
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Date options: Show the day of the week: on
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE H:mm'

# mission control

## Hot corners
## Possible values:
##  0: no-op
##  2: Mission Control
##  3: Show application windows
##  4: Desktop
##  5: Start screen saver
##  6: Disable screen saver
##  7: Dashboard
## 10: Put display to sleep
## 11: Launchpad
## 12: Notification Center
## Bottom right screen corner → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# trackpad

## Enable `Tap to click`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# language

## os langueget to en
defaults write -g AppleLanguages -array en ja

# screen saver

## Require password immediately after the computer went into
## sleep or screen saver mode
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

killall Finder
