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
