if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages
apps=(
  calibre
  cheatsheet
  docker
  google-backup-and-sync
  google-chrome
  haroopad
  iterm2
  postico
  rectangle
  sequel-pro
  slack
  skype
  spotify
  the-unarchiver
  transmission
  virtualbox
  virtualbox-extension-pack
  visual-studio-code
  vlc
  vnc-viewer
  whatsapp

  ## REVISAR
  # alfred
  # dash2
  # dropbox
  # firefox
  # flux
  # font-fira-code
  # glimmerblocker
  # hammerspoon
  # kaleidoscope
  # macdown
  # opera
  # screenflow
  
)

brew install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
