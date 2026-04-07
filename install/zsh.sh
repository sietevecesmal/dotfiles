# if ! is-macos -o ! is-executable brew; then
#   echo "Skipped: ZSH"
#   return
# fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


ln -sfv "$DOTFILES_DIR/symlink/.zshenv" ~/.zshenv
ln -sfv "$DOTFILES_DIR/symlink/.zshrc" ~/.zshrc

# ln -sfv ~/.dotfiles/symlink/.* ~/
touch ~/.z

chsh -s /bin/zsh
