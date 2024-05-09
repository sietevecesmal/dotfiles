#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Ask for the sudo password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until bootstrap has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Allocate symlinks

ln -sfv "$DOTFILES_DIR/symlink/.alias" ~
ln -sfv "$DOTFILES_DIR/symlink/.boto" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/symlink/.iterm" ~

# Install packages
echo "Installing packages..."

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/cask.sh"
. "$DOTFILES_DIR/install/pip.sh"

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
