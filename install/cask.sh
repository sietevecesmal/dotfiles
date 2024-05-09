if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages
casks=(
  1password
  ankerwork
  arc
  calibre
  cheatsheet
  discord
  expressvpn
  haroopad
  maccy
  rectangle
  skype
  steam
  telegram
  the-unarchiver
  visual-studio-code
  vlc
  vnc-viewer
  whatsapp
)

brew install "${casks[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
