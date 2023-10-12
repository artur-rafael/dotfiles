# Dotfiles Repository

This repository was established for the purpose of storing configurations, facilitating the seamless transfer of configurations and workflows across different machines.

## Update Dotfiles

Consider normal git commands but instead of using the keyword "git" at the beginning of a command use "config". This alias should be in .bashrc file.

Example for updating .vimrc file.

    > config status
    > config add .vimrc
    > config commit -am "update vimrc config"
    > config push

## Install Dotfiles in another machine

    > git clone --bare ssh://git@stash-server.elecnor-deimos.com:7999/~arrr/dotfiles.git $HOME/.myconfigs

**Check reference links if there are issues.**   
Might create a script to perform the installation automatically just like Atlassian suggests.

## References
[Atlassian tutorials](https://www.atlassian.com/git/tutorials/dotfiles)  
[YT video tutorial](https://www.youtube.com/watch?v=tBoLDpTWVOM)

