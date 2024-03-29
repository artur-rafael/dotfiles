# Dotfiles Repository

Welcome to my dotfiles repository! This collection of dotfiles serves as a centralized and version-controlled configuration for customizing various aspects of my development environment. Dotfiles are an excellent way to personalize and synchronize settings across different machines, ensuring a consistent and tailored environment wherever I work.

___

# Configuration Files for Integrated Tools

- **bash** is a command-line interpreter for Unix-like operating systems, providing a text-based interface to interact with the system, run programs, and automate tasks using scripts.
- **git** is a distributed version control system (DVCS) used for tracking changes in source code during software development. Git is known for its speed, flexibility, and distributed nature, allowing multiple developers to collaborate on projects seamlessly.
- **tmux** is a command-line tool that enables users to create and manage multiple terminal sessions within a single terminal window. It provides a way to organize, split, and switch between different terminal panes and windows, allowing users to work on multiple tasks simultaneously without needing to open multiple terminal windows.
- **vim**, a highly configurable and efficient text editor for command-line. Vim is known for its powerful features, speed, and extensibility.

___

# Install on a New Machine

## Prior to Clone

You should have git installed

    > sudo apt install git

Make sure to have this alias in the **.bashrc** file as the following alias set. So that git doesn't interfere with other repositories.

    > echo "alias config='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'" >> ~/.bashrc

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems

    > echo ".myconfigs" >> ~/.gitignore

## Clone

To use these dotfiles configuration on a new machine:

    > git clone --bare --recursive git@github.com:artur-rafael/dotfiles.git ~/.myconfigs

## After Cloning

Checkout the actual content from the bare repository to $HOME. If there are errors, remove or backup the files causing the issues.

    > config checkout

Set the flag showUntrackedFiles to no on this specific (local) repository:

    > config config --local status.showUntrackedFiles no

Populate the config file with the submodules and update them:

    > config submodule update --init --recursive

## Configure Git (Optional)

The current .gitconfig includes a .gitconfig-user file that should contain machine specific configurations. One of the configuration can the about the user name and email. To configure this do the following:

    > touch .gitconfig-user

Populate the file with your information:

```
[user]
    name = Artur Rafael
    email = artur_m_rafael@hotmail.com
```

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

## Clone Repository with Submodules

**Method A)** By adding the --recursive flag to git clone command, the repository and all the submodules within the repository are cloned.

    > git clone <repo-link> --recursive

**Method B)** There is also the manual way to initialize the submodules after the clone.

    > git clone <repo-link>
    > git submodule update --init --recursive

## Go to a Specific Commit or Tag within the Submodule History

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

## Remove a Submodule from the Repository

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
