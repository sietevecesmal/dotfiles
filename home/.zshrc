# Homebrew (Apple Silicon, Intel or Linux)
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
unset brew_bin

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="miloshadzic"
plugins=(
  git
  dotenv
  command-not-found
  z
)
[[ "$OSTYPE" == darwin* ]] && plugins+=(macos)
source "$ZSH/oh-my-zsh.sh"

if [ -n "$HOMEBREW_PREFIX" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" 2>/dev/null
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
[ -n "$HOMEBREW_PREFIX" ] && export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"

command -v mise >/dev/null && eval "$(mise activate zsh)"
command -v thefuck >/dev/null && eval "$(thefuck --alias)"

# Shell files from the public repo, then the private overlay:
# zsh/*.zsh everywhere, zsh/profiles/<profile>.zsh for this machine's profile
for dotfiles_zsh_dir in "$DOTFILES_DIR/zsh" "$DOTFILES_PRIVATE_DIR/zsh"; do
  for dotfiles_zsh_file in "$dotfiles_zsh_dir"/*.zsh(N) \
                           ${DOTFILES_PROFILE:+"$dotfiles_zsh_dir/profiles/$DOTFILES_PROFILE.zsh"}; do
    [ -f "$dotfiles_zsh_file" ] && source "$dotfiles_zsh_file"
  done
done
unset dotfiles_zsh_dir dotfiles_zsh_file

# Per-machine overrides, not committed
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# brew doctor: keep Homebrew's bin/sbin ahead of /usr/bin in PATH.
# typeset -U dedupes; re-prepending after all the other PATH mutations
# (mise, krew, etc.) wins over the inherited /etc/zprofile entry.
typeset -U path
[ -n "$HOMEBREW_PREFIX" ] && path=("$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin" $path)
export PATH
