#!/bin/bash
set -u

abort() {
  echo "✨✨✨"
  printf "%s\n" "$@"
  echo "✨✨✨"
  exit 1
}

# if bash not installed, then abort
if ! command -v bash > /dev/null
then
  abort "Bash is required to interpret this script."
fi

if ! brew --version > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "✨✨✨"
echo "Alright, awesome!  Let's get this Mac Rocking!"
echo "Installing the basics: 1Password, Spotify, Chrome and Spectacle 🎧"
echo "✨✨✨"
brew install --cask spectacle
sleep 3
open -a Spectacle
brew install --cask 1password
sleep 3
open -a 1Password\ 7
brew install --cask google-chrome
sleep 3
open -a Google\ Chrome
brew install --cask spotify
sleep 3
open -a Spotify

echo "✨✨✨"
echo "Installing everthing else.  This is going to take awhile!"
echo "✨✨✨"

# MacOS Changes
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Set the icon size of Dock items to 15 pixels
defaults write com.apple.dock tilesize -integer 15

# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

 Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

killall Dock

# Communication
brew install --cask slack
brew install --cask whatsapp
brew install --cask telegram
brew install --cask discord
brew install --cask loom
brew install --cask signal

# OS Basics
brew install --cask firefox
brew install --cask notion
brew install --cask clocker
brew install --cask transmission
brew install --cask the-unarchiver
brew install --cask raindropio

# Developer
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ZSH
brew install --cask billings-pro
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask atom
brew install --cask docker
brew install --cask sizzy
brew install gh
brew install postgresql
brew install redis
brew install --cask navicat-premium-essentials
brew install ruby-install
brew install chruby
touch ~/.bash_profile
touch ~/.zshrc
echo "source /usr/local/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
echo "source /usr/local/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
echo "source /usr/local/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source /usr/local/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc

brew install node
brew install yarn
brew install gawk
ruby-install --latest
ruby-install ruby 3.0.1
ruby-install ruby 2.7.3

# Media
brew install --cask vlc
brew install --cask audacity
brew install handbrake
brew install --cask figma

#Crypto
brew install --cask binance
brew install --cask tradingview
brew install exodus

# At the bottom because it asks for sudo password
brew install --cask zoom


echo ""
echo ""
echo "✨✨✨"
echo "Installation Complete"
echo "✨✨✨"
