#!/usr/bin/env bash

# Usage: ./bootstrap.sh [work]
#   work  - Only install work-related packages (skips personal apps)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR DOTFILES_MODE
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_MODE="${1:-personal}"

# Ask for the sudo password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin "$(git -C "$DOTFILES_DIR" rev-parse --abbrev-ref HEAD)"; fi

# Allocate symlinks

ln -sfv "$DOTFILES_DIR/symlink/.alias" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitignore_global" ~

# Install packages
echo "Installing packages (mode: $DOTFILES_MODE)..."

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/cask.sh"
. "$DOTFILES_DIR/install/pip.sh"

if [ "$DOTFILES_MODE" = "work" ]; then
  . "$DOTFILES_DIR/install/work.sh"
fi

# Run macos settings
echo "Updating macOS settings..."
. "$DOTFILES_DIR/macos/defaults.sh"
. "$DOTFILES_DIR/macos/defaults-apps.sh"

# Run dock settings
echo "Updating Dock settings..."
. "$DOTFILES_DIR/macos/dock.sh"

# Configure shell
echo "Configuring shell..."
. "$DOTFILES_DIR/install/zsh.sh"
