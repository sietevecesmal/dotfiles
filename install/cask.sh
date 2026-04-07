if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Base packages (always installed)
casks=(
  1password
  arc
  maccy
  rectangle
  the-unarchiver
  visual-studio-code
  vlc
  warp
  whatsapp
)

# Personal packages (skipped in work mode)
if [ "$DOTFILES_MODE" != "work" ]; then
  casks+=(
    ankerwork
    calibre
    discord
    expressvpn
    steam
    telegram
    vnc-viewer
  )
fi

brew install "${casks[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
# if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
