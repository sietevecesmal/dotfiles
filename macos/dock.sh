#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Arc.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Ghostty.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"

# Work-only apps
if [ "$DOTFILES_PROFILE" = "work" ]; then
  dockutil --no-restart --add "/Applications/Slack.app"
fi

killall Dock
