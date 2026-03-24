cat ~/.motd

# Source zsh plugins
# source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244,bold' 

# System Aliases
alias ..="cd .."
alias x="exit"

# Unique history (no duplicates)
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_DUPS HIST_FIND_NO_DUPS

eval "$(starship init zsh)"
alias ssh="TERM=xterm-256color ssh"
export PATH="$HOME/.local/bin:$PATH"
