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
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/tomcat@7/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# rbenv init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#nvm init
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv init
eval "$(pyenv init -)"
