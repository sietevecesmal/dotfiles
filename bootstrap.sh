#!/usr/bin/env bash
# Set up a new machine (macOS or Linux):
#
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/sietevecesmal/dotfiles/master/bootstrap.sh)" -- work
#
# or, with the repo already cloned:  ~/.dotfiles/bootstrap.sh [work|personal]
#
# Forked it? Change DOTFILES_REPO below (or export it before running).
# Private overlay: export DOTFILES_PRIVATE_REPO=<git url> to clone it into
# ~/.dotfiles-private too (needs access to it, e.g. SSH keys already set up).

set -e

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/sietevecesmal/dotfiles.git}"
DOTFILES_PRIVATE_REPO="${DOTFILES_PRIVATE_REPO:-}"
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_PRIVATE_DIR="$HOME/.dotfiles-private"

# macOS ships a /usr/bin/git stub that only works once the Command Line Tools are installed
if [[ "$OSTYPE" == darwin* ]] && ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools (needed for git); re-run this script when it finishes."
  xcode-select --install
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y git
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y git
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --needed --noconfirm git
  fi
fi

# $1 = repo url, $2 = directory
clone_or_pull () {
  if [ -d "$2/.git" ]; then
    git -C "$2" pull --rebase --autostash
  else
    git clone "$1" "$2"
  fi
}

clone_or_pull "$DOTFILES_REPO" "$DOTFILES_DIR"
if [ -n "$DOTFILES_PRIVATE_REPO" ]; then
  clone_or_pull "$DOTFILES_PRIVATE_REPO" "$DOTFILES_PRIVATE_DIR" ||
    echo "Could not clone the private overlay; continuing without it (clone it later and run 'dotfiles sync')."
fi

exec "$DOTFILES_DIR/bin/dotfiles" install "$@"
