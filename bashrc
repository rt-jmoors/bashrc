alias vim='C:\Program Files\Neovim\bin\nvim.exe'
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Default fzf search history from chatGPT
#__fzf_history__() {
#  local selected=$(history | tac  | fzf --tac --height=40% --reverse --border --query="$READLINE_LINE")
#  if [ -n "$selected" ]; then
#    READLINE_LINE=$(echo "$selected" | sed 's/ *[0-9]* *//')
#    READLINE_POINT=${#READLINE_LINE}
#  fi
#}

#Setup FZF for Fuzzy Reverse History Search in Bash
# Press Ctrl+R to search command history with fzf
__fzf_history__() {
  # Get the last 20 commands from history in reverse order for fzf
  #local selected=$(history | tail -n 40 |  fzf --tac --height=50% --reverse --border --query="$READLINE_LINE")
  local selected=$(history | tail -n 1000 |  fzf --tac --height=40% --reverse --border --query="$READLINE_LINE")
  
  if [ -n "$selected" ]; then
    # Remove the leading history numbers
    READLINE_LINE=$(echo "$selected" | sed 's/ *[0-9]* *//')
    READLINE_POINT=${#READLINE_LINE}
  fi
}

bind -r '"\C-r": __fzf_history__'

# -------------------------------
# FZF-based history search with most recent command at top
# -------------------------------
#__fzf_history_full__() {
#  # Reverse history order: newest first
#  local selected=$(history | tail -n 20 | tac | fzf --height=50% --reverse --border --query="$READLINE_LINE")
#  
#  if [ -n "$selected" ]; then
#    # Remove leading history numbers
#    READLINE_LINE=$(echo "$selected" | sed 's/ *[0-9]* *//')
#    READLINE_POINT=${#READLINE_LINE}
#  fi
#}
#
## Bind Ctrl+R to the full history search
#bind -x '"\C-x": __fzf_history_full__'
