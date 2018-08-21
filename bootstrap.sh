#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Allocate symlinks

ln -sfv "$DOTFILES_DIR/symlink/.alas" ~
ln -sfv "$DOTFILES_DIR/symlink/.boto" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/symlink/.gitignore_global" ~

# Install packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/cask.sh"
. "$DOTFILES_DIR/install/pip.sh"
. "$DOTFILES_DIR/install/zsh.sh"

# Run tests

# if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi
