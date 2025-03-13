#!/usr/bin/env bash

# Personal macOS settings setup script
# Based on https://github.com/kevinSuttle/macOS-Defaults/
# and https://macos-defaults.com/

# Close any open System Settings panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Settings" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##########################
# General UI/UX settings
##########################

# Autohide dock
defaults write com.apple.dock "autohide" -bool "true" 

# Minimization animation effect to "scale"
defaults write com.apple.dock "mineffect" -string "scale" 

# Disable shadow in screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Disable bootup sound
nvram SystemAudioVolume=" "

# Mission Control group windows by applications
defaults write com.apple.dock "expose-group-apps" -bool "true"

# TextEdit disable rich text
defaults write com.apple.TextEdit "RichText" -bool "false"

# TextEdit no smart quotes
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"

# Disable Apple Intelligence
defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"

# Disable mouse acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"

# Always show scroll bar
defaults write -globalDomain AppleShowScrollBars 'Always'


##########################
# Finder settings
##########################

# Set default search scope to current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true" 

##########################
# Trackpad
##########################

# Dragging with three finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

##########################
# Keyboard
##########################

# Don't show character accents menu when key is held down
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# Disable input source switch popup
defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist redesigned_text_cursor -dict-add Enabled -bool NO
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool "false"

# Enable keyboard navigation
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

