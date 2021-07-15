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

# Generate completion files
autoload -U compinit && compinit

# Bindkeys (wrapped in a function to run after zsh-vi-mode init)
function bind_keys() {
  # vi mode
  bindkey -v
  # Use vim keys in tab complete menu:
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
  bindkey -M menuselect 'j' vi-down-line-or-history
  bindkey -v '^?' backward-delete-char

  # Fix Alt+Backspace to keep deleting backword word
  bindkey '^[^?' backward-kill-word

  # Fix Home/End keys
  bindkey "^[[H" beginning-of-line
  bindkey '^[OH' beginning-of-line
  bindkey "^[[F" end-of-line
  bindkey '^[OF' end-of-line

  # Accept autosuggestion with Ctrl+N
  bindkey '^N' autosuggest-accept

  # Open fzf-marker for directory bookmarks
  bindkey '^k' fzm
}

# Load Fuzzy Finder
function load_fzf() {
  [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
  [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
  # Load fzf-marks
  [ -f /opt/fzf-marks/fzf-marks.plugin.zsh ] && source /opt/fzf-marks/fzf-marks.plugin.zsh
}

# Wrap settings within this function to override zsh-vi-mode keybindings
function zvm_after_init() {
  bind_keys
  load_fzf

  # Cursor modes (with zsh-vi-mode); must be after plugin loading
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
}

# Load auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# Load syntax highlighting;
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
# Load vi-mode plugin (must load after zsh-autosuggestions; for sparse cmd-line to work)
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Load aliases (load last to override any previous aliases)
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
fi
