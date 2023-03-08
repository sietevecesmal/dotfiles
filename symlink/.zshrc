export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="miloshadzic"

plugins=(
  git
  bundler
  dotenv
  macos
  command-not-found
  z
)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
