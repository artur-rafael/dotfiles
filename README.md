# Dotfiles

My personal dotfiles, managed with GNU Stow.

## Setup

Install GNU Stow and clone this repo to `~/dotfiles`. From that directory, choose either command.

```sh
cd ~/dotfiles
stow nvim   # Link just the Neovim config
stow */     # Link all configs
```

Stow links configs into the parent directory, so `stow nvim` makes the Neovim config available at `~/.config/nvim`. To unlink it, run `stow -D nvim`.

## Dependencies

Install the tools for the configs you use.

- **Alacritty** uses the JetBrains Mono font.
- **Bash** uses Git for the branch prompt and Neovim for the `v`, `vi` and `vim` aliases. After `stow bash`, add `source ~/.config/bash/custom.bash` to `~/.bashrc`.
- **Git** uses Vim as its editor. Check the commit name and email before using this config.
- **Neovim** needs version 0.12+, Git for plugins, ripgrep for search, and Node.js/npm for language servers. Building parsers requires a C compiler, curl, tar and the tree-sitter CLI 0.26.1+. Open Neovim once with an internet connection to install plugins and tools.
- **tmux** uses the `tmux-256color` terminfo entry.
