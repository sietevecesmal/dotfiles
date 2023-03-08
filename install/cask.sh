if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages
casks=(
  1password
  calibre
  cheatsheet
  discord
  expressvpn
  google-drive
  google-chrome
  haroopad
  iterm2
  maccy
  rectangle
  skype
  spotify
  steam
  telegram
  the-unarchiver
  transmission
  visual-studio-code
  vlc
  vnc-viewer
  whatsapp

  ## REVIEW
  # alfred
  # dash2
  # flux
  # font-fira-code
  # glimmerblocker
  # hammerspoon
  # kaleidoscope
  # macdown
  # opera
  # screenflow
  
)

brew install "${casks[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
