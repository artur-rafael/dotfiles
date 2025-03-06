# Dotfiles Repository

Welcome to my dotfiles repository, these files configure the main tools I use daily in my work environment.

___

# Install on a New Machine

## Prior to Clone

Make sure to have this alias in the **.bashrc** file as the following alias set. So that git doesn't interfere with other repositories.

    echo "alias config='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'" >> ~/.bashrc

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems

    echo ".myconfigs" >> ~/.gitignore

## Clone

To use these dotfiles configuration on a new machine:

    git clone --bare --recursive git@github.com:artur-rafael/dotfiles.git ~/.myconfigs

## After Cloning

Checkout the actual content from the bare repository to $HOME. If there are errors, remove or backup the files causing the issues.

    config checkout

Set the flag showUntrackedFiles to no on this specific (local) repository:

    config config --local status.showUntrackedFiles no

Populate the config file with the submodules and update them:

    config submodule update --init --recursive

## Configure Git (Optional)

The current .gitconfig includes a .gitconfig-user file that should contain machine specific configurations. One of the configuration can the about the user name and email. To configure this do the following:

    echo "[user]" >> ~/.gitconfig-user
    echo "	name = Artur Rafael" >> ~/.gitconfig-user
    echo "	email = 76266382+artur-rafael@users.noreply.github.com" >> ~/.gitconfig-user

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

This repository uses Git Submodules to manage plugins.

Unfortunately the .gitmodules file can't be placed inside the bare repository folder (.myconfigs). This file stores all the information about the repository submodules.

## How to add vim plugins

    cd ~/.vim/pack/my-plugins/start
    config submodule add --depth=1 <repo-link> vim-<plugin-name>

This allows to add a new plugin with a consistent name (e.g. "vim-plugin-name"). The depth flag specifies the number of commits to include in the initial clone. It allows you to create a shallow clone, which contains only a limited history of the repository.

## How to update plugins

    config submodule foreach --recursive git pull origin master

This allows to update all the repository modules. The recursive flag is there in case there are submodules within submodules.

## Go to a Specific Commit or Tag within the Submodule History

Move to the submodule directory, git will understand its a submodule and all the git commands will be applied to the submodule repository.

> cd <submodule-path>
> git checkout <tag>/<commit>

Leave submodule directory for git to assume the repository directory. Validate the change with status.
> cd ..
> git status

Commit the change the way you prefer.
> git commit -m "moved submodule to v1.0"
> git push

Then, another developer who wants to have the submodule in the same tag/commit, have to do this:

    git pull
    git submodule update --init --recursive

## Remove a Submodule from the Repository

Remove the submodule entry from .git/config

    config submodule deinit -f <submodule-path>

Remove the submodule directory from the superproject's .git/modules directory

    rm -rf .git/modules/<submodule-path>

Remove the entry in .gitmodules and remove the submodule directory

    config rm -f <submodule-path>

___

# References

[Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

[Youtube](https://www.youtube.com/watch?v=tBoLDpTWVOM)
