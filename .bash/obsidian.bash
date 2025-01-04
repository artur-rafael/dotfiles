# Create or open the daily note
dnote()
{
   local date=$(date +'%Y-%m-%d')
   local filepath="$HOME/Documents/obsidian-vault/dailies/${date}.md"
   mkdir -p "$(dirname $filepath)" # ensure directory exists
   vim "$filepath"
}

# Create or open any new note with a given name/path
note()
{
   local filepath="$HOME/Documents/obsidian-vault/$1"
   mkdir -p "$(dirname "$filepath")" # ensure directory exists
   vim "$filepath"
}

# Completions based on the files and directories inside vault
_note_autocomplete()
{
   local cur_word="${COMP_WORDS[COMP_CWORD]}"
   local vault_dir="$HOME/Documents/obsidian-vault"
   local word_to_complete="${vault_dir}/${cur_word}"

   # Get the list of files/directories that match the current word
   local suggestions=$(compgen -f "$word_to_complete")

   # Remove the vault_dir prefix from the suggestions
   COMPREPLY=()
   for suggestion in $suggestions; do
      # Strip the leading vault directory path
      COMPREPLY+=("${suggestion#$vault_dir/}")
   done
}

# Tells bash to use _note_autocomplete function for completions for 'note'
complete -F _note_autocomplete note

# Shortcut aliases
alias n='note'
alias dn='dnote'
