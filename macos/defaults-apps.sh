###############################################################################
# Chrome                                                                      #
###############################################################################
# # Disable swipe navigation
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
#
# # Use the system-native print preview dialog
# defaults write com.google.Chrome DisablePrintPreview -bool true
# defaults write com.google.Chrome.canary DisablePrintPreview -bool true
#
# # Expand the print dialog by default
# defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
# defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4

# Install the Solarized Dark theme for iTerm
# open "${HOME}/init/Solarized Dark.itermcolors"

# Disable audible and visual bells
# defaults write com.apple.terminal "Bell" -bool false
# defaults write com.apple.terminal "VisualBell" -bool false

# Disable the annoying line marks
# defaults write com.apple.Terminal ShowLineMarks -int 0

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false