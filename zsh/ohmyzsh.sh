#!/usr/bin/zsh

#!/usr/bin/zsh

export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Theme
ZSH_THEME="af-magic" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" ) # Used when ZSH_THEME is set to `random`

# Formatting
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true" # Makes _ and - interchangeable.

DISABLE_MAGIC_FUNCTIONS="false" # Disable if URLs and formatting is broken.
DISABLE_LS_COLORS="false" # Disables colours in `ls`
DISABLE_AUTO_TITLE="false" # Auto-sets the terminal title
ENABLE_CORRECTION="true" # Enables command

# Misc Features
DISABLE_UNTRACKED_FILES_DIRTY="true" # Git: disables marking of untracked files as dirty
COMPLETION_WAITING_DOTS="true" # Displays red dots when waiting for completions.
# HIST_STAMPS="mm/dd/yyyy" # Changes the command execution timestamp (see `man strftime`).
ZSH_CUSTOM="$ZSH/custom" # Specifies the path for custom files. Defaults to `$ZSH/custom`
