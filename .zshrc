source $HOME/antigen.zsh

antigen bundle jeffreytse/zsh-vi-mode

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Theme
antigen theme candy

# Apply
antigen apply

# Alias
## For Mac
alias sed='gsed'
## ls
alias ls='lsd -l'
alias la='lsd -la'
## tmux
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tks='tmux kill-server'
alias tl='tmux ls'

# Path
## Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## pnpm
export PNPM_HOME="/Users/taru/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## NVM
source $(brew --prefix nvm)/nvm.sh
## cargo
export PATH=$HOME/.cargo/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taru/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taru/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taru/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taru/google-cloud-sdk/completion.zsh.inc'; fi

[ -f "/Users/taru/.local/share/juvix/env" ] && source "/Users/taru/.local/share/juvix/env" # juvix-env
[ -f "/Users/taru/.ghcup/env" ] && source "/Users/taru/.ghcup/env" # ghcup-env


