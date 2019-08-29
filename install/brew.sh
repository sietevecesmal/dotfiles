if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# Install packages

apps=(
  antigen
  coreutils
  dockutil
  mackup
  nvm
  python
  rbenv
  tfenv
  # thefuck
  vim
  wget
  wifi-password
  zsh

  ## REVISAR
  # bash-completion2
  # bats
  # diff-so-fancy
  # ffmpeg
  # fasd
  # gifsicle
  # git
  # git-extras
  # gnu-sed --with-default-names
  # grep --with-default-names
  # hub
  # httpie
  # imagemagick
  # jq
  # lynx
  # nano
  # pandoc
  # peco
  # psgrep
  # shellcheck
  # ssh-copy-id
  # tree
  # unar
)

brew install "${apps[@]}"

# export DOTFILES_BREW_PREFIX_COREUTILS=$(brew --prefix coreutils)
# set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

# ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
