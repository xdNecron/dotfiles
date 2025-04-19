# Dotfiles

## Dependencies

- git 
- stow

Install stow using your system package manager.

## Installation

Clone the repository to your home folder. `cd` inside the cloned repo and run

```bash
stow .
```

Stow will automatically symlink all files and directories inside the dotfile folder to its corresponding location in the home folder.
Remember, the working tree inside the dotfile folder has to be the same as in your home folder. For example if you wish to add your Neovim
configuration inside `~/.config/nvim`, it has to be stored on the path `.config/nvim` inside the dotfile folder.

## Ignoring files with stow

Check the docs, bozo.
