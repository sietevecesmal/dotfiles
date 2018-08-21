# if ! is-macos -o ! is-executable brew; then
#   echo "Skipped: ZSH"
#   return
# fi

# brew install zsh
# brew install antigen

ln -sfv ~/.dotfiles/symlink/.zshrc ~/.zshrc

# ln -sfv ~/.dotfiles/symlink/.* ~/
touch ~/.z

/bin/zsh
chsh -s /bin/zsh
