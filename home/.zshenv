# Runs for every zsh (interactive or not): keep it to env vars only.

export DOTFILES_DIR="$HOME/.dotfiles"
export DOTFILES_PRIVATE_DIR="$HOME/.dotfiles-private"

# Per-machine settings, not committed (DOTFILES_PROFILE, DOTFILES_COMPUTER_NAME...)
[ -f "$HOME/.dotfiles.local" ] && source "$HOME/.dotfiles.local"

path=("$DOTFILES_DIR/bin" $path)
