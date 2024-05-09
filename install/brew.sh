if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

if ! command -v brew 1>/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


brew update
brew upgrade

# Install packages
apps=(
  coreutils
  dockutil
  jq
  mackup
  thefuck
  vim
  wget
  wifi-password
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
)

brew install "${apps[@]}"

# export DOTFILES_BREW_PREFIX_COREUTILS=$(brew --prefix coreutils)
# set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

# ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
