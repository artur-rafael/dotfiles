# Dotfiles Repository

Welcome to my dotfiles repository! This collection of dotfiles serves as a centralized and version-controlled configuration for customizing various aspects of my development environment. Dotfiles are an excellent way to personalize and synchronize settings across different machines, ensuring a consistent and tailored environment wherever I work.

___

# Tools

- **vim**, a highly configurable and efficient text editor for command-line. Vim is known for its powerful features, speed, and extensibility.
- **tmux** is a command-line tool that enables users to create and manage multiple terminal sessions within a single terminal window. It provides a way to organize, split, and switch between different terminal panes and windows, allowing users to work on multiple tasks simultaneously without needing to open multiple terminal windows.
- **git** is a distributed version control system (DVCS) used for tracking changes in source code during software development. Git is known for its speed, flexibility, and distributed nature, allowing multiple developers to collaborate on projects seamlessly.

___

# Getting Started

Prior to the installation: Make sure that in the **.bashrc** file as the following alias set. So that git doesn't interfere with other repositories.

    > alias config='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems

    > echo ".myconfigs" >> .gitignore

To use these dotfiles configuration on a new machine:

    > git clone --bare --recursive ssh://git@stash-server.elecnor-deimos.com:7999/~arrr/dotfiles.git $HOME/.myconfigs

This will create a Git bare repository in the .myconfigs folder in the /home/ directory. The recursive flag will also clone any dependencies (check submodules tab for more info).
A Git bare repository is a special type of repository that does not have a working directory. Unlike a typical Git repository that contains your project files and a hidden .git directory, a bare repository only contains the version control information.

Define the alias in the current shell scope, or re-open shell:

    > alias config='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'

Checkout the actual content from the bae repository to $HOME. If there are errors, remove or backup the files causing the issues.

    > config checkout

___

# Update Dotfiles

Consider normal git commands but instead of using the keyword "git" at the beginning of a command use "config". This alias should be in .bashrc file.

Example for updating .vimrc file.
    
    > config status
    > config add .vimrc
    > config commit -am "update vimrc config"
    > config push

___

# Git Submodules

This repository leverages **Git Submodules** to streamline the management of plugins. Git submodules provide a modular and version-controlled approach to integrating external dependencies, allowing for easy addition, updates, and maintenance of plugins.
- **Seamless Integration:** Git submodules seamlessly integrate external repositories as part of your project, making it easy to incorporate plugins without cluttering the main codebase.
- **Version Control:** Each submodule is a Git repository with its own version history. This allows precise control over plugin versions and easy rollbacks if needed.
- **Centralized Configuration:** Plugin configurations are centralized within the project repository, simplifying the setup process for contributors and ensuring consistency across environments.
- **Efficient Updates:** Submodules can be updated independently, ensuring that the latest versions of plugins are easily accessible. This reduces the risk of stale dependencies and promotes a more agile development process.

Unfortunately the **.gitmodules** file can't be placed inside the bare repository folder (.myconfigs). This file stores all the information about the repository submodules.

## How to add vim plugins

	> cd ~/.vim/pack/my-plugins/start
	> config submodule add --depth=1 <repo-link> vim-<plugin-name>

This allows to add a new plugin with a consistent name (e.g. "vim-plugin-name"). The depth flag specifies the number of commits to include in the initial clone. It allows you to create a shallow clone, which contains only a limited history of the repository.

## How to update plugins

	> config submodule foreach --recursive git pull origin master

This allows to update all the repository modules. The recursive flag is there in case there are submodules within submodules.

## Clone repository with submodules

**Method A)** By adding the --recursive flag to git clone command, the repository and all the submodules within the repository are cloned.

    > git clone <repo-link> --recursive

**Method B)** There is also the manual way to initialize the submodules after the clone.

    > git clone <repo-link>
    > git submodule update --init --recursive

## Go to a specific commit or tag within the submodule history

Move to the submodule directory, git will understand its a submodule and all the git commands will be applied to the submodule repository.

    > # Move to submodule directory.
    > cd <submodule-path>
    > git checkout <tag>/<commit>
    > # Leave submodule directory for git to assume the repository directory.
    > cd ..
    > # Validate change (optional)
    > git status
    > # Commit the change the way you prefer.
    > git commit -m "moved submodule to v1.0"
    > git push

Then, another developer who wants to have the submodule in the same tag/commit, have to do this:

    > git pull
    > git submodule update --init --recursive

## Remove a submodule from the repository

Remove the submodule entry from .git/config

    > git submodule deinit -f <submodule-path>

Remove the submodule directory from the superproject's .git/modules directory

    > rm -rf .git/modules/<submodule-path>

Remove the entry in .gitmodules and remove the submodule directory

    > git rm -f <submodule-path>

___

# References
[Atlassian tutorials](https://www.atlassian.com/git/tutorials/dotfiles)  
[YT video tutorial](https://www.youtube.com/watch?v=tBoLDpTWVOM)

