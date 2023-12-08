#!/usr/bin/zsh

export PATH="$PNPM_HOME:$PATH" # pnpm
export PATH=$PATH:$HOME/.spicetify # spicetify
export PATH=$PATH:/opt/platform-tools # adb, etc.
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts # Jetbrains Toolbox IDEs

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # Completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"