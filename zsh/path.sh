#!/usr/bin/zsh

export PATH="$PATH:$PNPM_HOME" # pnpm
export PATH="$PATH:$HOME/.spicetify" # spicetify
export PATH="$PATH:/opt/platform-tools" # adb, etc.
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts" # Jetbrains Toolbox IDEs
export PATH="$PATH:$HOME/flero/.luarocks/bin" # luarocks binary files

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"

# Bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # Completions
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

# rbenv (Ruby)
eval "$(rbenv init - zsh)"

# Add .NET Core SDK tools
export PATH="$PATH:/home/flero/.dotnet/tools"
