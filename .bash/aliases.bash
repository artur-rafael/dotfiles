# navigation
#alias -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias doc='cd ${HOME}/Documents; ls'
alias dow='cd ${HOME}/Downloads; ls'

# clear
alias c='clear'
alias ct='clear && tree'

# vim
alias v='vim'
alias vi='vim'

# interactive mode
alias cp='cp -vi'
alias ln='ln -vi'
alias mv='mv -vi'
alias rm='rm -vi'

# list
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l1='ls -1'

# make
alias mk='make'
alias mkc='make clean'

# tmux
alias tm='tmux'
alias tma='tmux attach-session'
alias tml='tmux list-sessions'
alias tmn='tmux new-session'

# python
alias python='python3'

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'
