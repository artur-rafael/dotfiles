# Dotfiles Repository

This repository was established for the purpose of storing configurations, facilitating the seamless transfer of configurations and workflows across different machines.

# Add new plugins

> config submodule add --depth=1 <repo-link> ~/.vim/pack/my-plugins/start/<repo-name>

# Update Dotfiles

Consider normal git commands but instead of using the keyword "git" at the beginning of a command use "config". This alias should be in .bashrc file.

Example for updating .vimrc file.
    
    > config status
    > config add .vimrc
    > config commit -am "update vimrc config"
    > config push

# Install Dotfiles in another machine

    > git clone --bare ssh://git@stash-server.elecnor-deimos.com:7999/~arrr/dotfiles.git $HOME/.myconfigs

**Check reference links if there are issues.**   
Might create a script to perform the installation automatically just like Atlassian suggests.

# Git Submodules

This repository leverages **Git Submodules** to streamline the management of plugins. Git submodules provide a modular and version-controlled approach to integrating external dependencies, allowing for easy addition, updates, and maintenance of plugins.
- **Seamless Integration:** Git submodules seamlessly integrate external repositories as part of your project, making it easy to incorporate plugins without cluttering the main codebase.
- **Version Control:** Each submodule is a Git repository with its own version history. This allows precise control over plugin versions and easy rollbacks if needed.
- **Centralized Configuration:** Plugin configurations are centralized within the project repository, simplifying the setup process for contributors and ensuring consistency across environments.
- **Efficient Updates:** Submodules can be updated independently, ensuring that the latest versions of plugins are easily accessible. This reduces the risk of stale dependencies and promotes a more agile development process.

Unfortunately the **.gitmodules** file can't be placed inside the bare repository folder (.myconfigs). This file stores all the information about the repository submodules.

## How to add vim plugins:

	> cd ~/.vim/pack/my-plugins/start
	> config submodule add --depth=1 <repo-link> vim-<plugin-name>

This allows to add a new plugin with a consistent name (e.g. "vim-plugin-name"). The depth flag specifies the number of commits to include in the initial clone. It allows you to create a shallow clone, which contains only a limited history of the repository.

## How to update plugins:

	> config submodule foreach --recursive git pull origin master

This allows to update all the repository modules. The recursive flag is there in case there are submodules within submodules.

# References
[Atlassian tutorials](https://www.atlassian.com/git/tutorials/dotfiles)  
[YT video tutorial](https://www.youtube.com/watch?v=tBoLDpTWVOM)

