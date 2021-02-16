# Natanael's config for the Zoomer Shell

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PowerLevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/p10k/p10k.zsh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/p10k/p10k.zsh"
fi

# Load aliases
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
fi

# Path to oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change directory of my custom zsh stuff
ZSH_CUSTOM="${XDG_DATA_HOME:-$HOME/.local/share}/zsh_custom"

# List plugins
plugins=(
  git
  docker
  docker-compose
)

# Load oh-my-zsh plugin manager
source $ZSH/oh-my-zsh.sh

# Fix Home/End keys
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# Accept autosuggestion with Ctrl+N
bindkey '^N' autosuggest-accept

# Generate completion files
autoload -U compinit && compinit

# Load Fuzzy Finder
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# Load auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
