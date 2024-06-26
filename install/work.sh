if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages
work=(
  aws-iam-authenticator
  colima
  istioctl
  kubectx
  lens
  pluto
  postico
  pyenv
  sequel-pro
  slack
  tfenv
  arttor/tap/helmify
  derailed/k9s/k9s
  warrensbox/tap/tgswitch
)

brew install "${work[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
