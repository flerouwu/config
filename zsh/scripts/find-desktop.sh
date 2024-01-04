#!/bin/zsh

# find-desktop <NAME>
#
#   Find a .desktop file that contains
#   the specified name.

##
# CONFIG
##

SearchLocations=(
    "/usr/share/applications/"
    "/usr/local/share/applications/"
    "$HOME/.local/share/applications/"
)

##
# Arguments
##

SearchQuery="$1"
if [[ ! -n SearchQuery ]]; then
    echo "Usage:\n    find-desktop <NAME>"
    exit 1
fi

##
# Program
##

for location ("$SearchLocations[@]"); do
    find $location -iname $SearchQuery
    grep --include=\*.desktop -rn $location -e $SearchQuery
done
