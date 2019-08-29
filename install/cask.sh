if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

apps=(
  atom
  calibre
  cheatsheet
  docker
  dosbox
  duet
  google-backup-and-sync
  google-chrome
  haroopad
  postico
  sequel-pro
  slack
  skype
  spectacle
  spotify
  the-unarchiver
  transmission
  tunnelblick
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
  # sourcetree
  # virtualbox
  # virtualbox-extension-pack
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
