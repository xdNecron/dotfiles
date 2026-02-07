# My dotfiles

## Dependencies

- git 
- stow

## Installation

Clone the repository and `cd` into it. Run:

```bash
./apply.sh
```

The script will automatically symlink all directories to `~/.config`.

## Ignoring files with stow

You may add Perl regex patterns to `.stow-local-ignore` file. All files which match any pattern listed will be ignored by stow. Check the [official documentation](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists) for more information.
