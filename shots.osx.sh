#!/bin/sh
mkdir -p ~/shots
defaults write com.apple.screencapture location ~/shots
killall SystemUIServer
