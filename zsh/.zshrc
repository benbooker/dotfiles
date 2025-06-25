# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Completion system
autoload -Uz compinit
compinit

# Prompt
export PS1='%n@%m:%F{green}%~%f$ '

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'

# GHCup environment
[[ -f "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"


