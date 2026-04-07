#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Arc.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Warp.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"

# Work-only apps
if [ "$DOTFILES_MODE" = "work" ]; then
  dockutil --no-restart --add "/Applications/Slack.app"
fi

killall Dock
