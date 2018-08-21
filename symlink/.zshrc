source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  # Guess what to install when running an unknown command.
  command-not-found
  # Other
  git
  z
  sublime
  # Syntax highlighting bundle.
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Load the theme.
antigen theme miloshadzic

# Tell antigen that you're done.
antigen apply

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

#Load aliases
# source $HOME/.aliases
#eval $(thefuck --alias)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/gonzalo/.sdkman"
# [[ -s "/Users/gonzalo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gonzalo/.sdkman/bin/sdkman-init.sh"
