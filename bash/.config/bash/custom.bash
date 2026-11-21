set -o vi

parse_git_branch() {
        local branch
        branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || return
        printf ' (%s)' "$branch"
}
PS1='[\[\e[32m\]\u@\h\[\e[0m\]] \[\e[1;34m\]\w\[\e[0m\]\[\e[33m\]$(parse_git_branch)\[\e[0m\]\n\$ '

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
