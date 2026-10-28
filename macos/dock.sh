#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Dia.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"

# Personal-only apps
if [ "$DOTFILES_PROFILE" = "personal" ]; then
  dockutil --no-restart --add "/Applications/Notion.app"
fi

dockutil --no-restart --add "/Applications/Ghostty.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/Applications/Claude.app"

# Work-only apps
if [ "$DOTFILES_PROFILE" = "work" ]; then
  dockutil --no-restart --add "/Applications/Slack.app"
fi

killall Dock
