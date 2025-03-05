# Setup fzf
# ---------
if [[ ! "$PATH" == *"$HOME/.fzf/bin"* ]]; then
   PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

eval "$(fzf --bash)"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
   --walker-skip .git
   --preview 'batcat -n --color=always {}' --preview-window '~2'
   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
   --color header:italic
   --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
   --tmux 90%
   --walker-skip .git
   --preview 'tree -C {}'"
