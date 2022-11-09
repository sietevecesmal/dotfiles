# if ! is-macos -o ! is-executable brew; then
#   echo "Skipped: ZSH"
#   return
# fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


ln -sfv ~/.dotfiles/symlink/.zshenv ~/.zshenv
ln -sfv ~/.dotfiles/symlink/.zshrc ~/.zshrc

# ln -sfv ~/.dotfiles/symlink/.* ~/
touch ~/.z

/bin/zsh
chsh -s /bin/zsh
