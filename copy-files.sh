#!/bin/sh

# This is a simple file to copy my config over.
# Basically just stops me from having to enter a bunch of
# commands to copy manually.

# Files - <original-path>:<absolute-git-path>
FILES=(
    "/etc/paru.conf:etc/paru.conf"

    # Kitty
    "$HOME/.config/kitty/kitty.conf:kitty/kitty.conf"
    "$HOME/.config/kitty/current-theme.conf:kitty/current-theme.conf"

    # Neofetch
    "$HOME/.config/neofetch/config.conf:neofetch/config.conf"
    "$HOME/.config/neofetch/cat.ascii:neofetch/cat.ascii"

    # VSCodium
    "$HOME/.config/VSCodium/User/keybindings.json:VSCodium/User/keybindings.json"
    "$HOME/.config/VSCodium/User/settings.json:VSCodium/User/settings.json"

    # ZSH
    "$HOME/.config/zsh/:zsh/"
    "$HOME/.zshrc:.zshrc"
)

# Copy Files - Overwrite if existing
for file in "${FILES[@]}"; do
    LOCATION="${file%%:*}"
    DESTINATION="${file#*:}"

    printf "Copying $LOCATION to $DESTINATION\n"
    mkdir --parents "$(dirname "$DESTINATION")"
    cp --force --recursive "$LOCATION" "$DESTINATION"
done

printf "Done!\n"