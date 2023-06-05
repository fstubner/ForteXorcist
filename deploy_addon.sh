#!/bin/bash

# Check if .env file exists
if [ -f .env ]; then
    # Load the .env file
    source .env
fi

# Prompt user for WoW install directory if not set in .env
if [ -z "$wow_install_directory" ]; then
    read -rp "Enter the path to your World of Warcraft installation directory: " wow_install_directory

    # Remove trailing slash from the path if it exists
    wow_install_directory="${wow_install_directory%/}"

    # Escape backslashes in the path
    wow_install_directory="${wow_install_directory//\\/\\\\}"

    # Save the WoW install directory to .env file
    echo "wow_install_directory=\"$wow_install_directory\"" > .env
fi

# Convert Windows path to UNIX-style path
convert_to_unix_path() {
    local path=$1

    # Convert backslashes to forward slashes
    path="${path//\\//}"

    # Convert drive letter to lowercase
    path=$(echo "$path" | sed 's/^\([A-Z]\):/\/\L\1/')

    # Remove excess slashes
    path=$(echo "$path" | sed 's/\/\//\//g')

    echo "$path"
}

# Usage function
usage() {
    echo "Usage: ./deploy_addon.sh <game_version>"
    echo "Available game versions: retail, classic"
    exit 1
}

# Copy addons function
copy_addons() {
    local src_dir="./ForteXorcist/"
    local dest_dir="${1}/Interface/AddOns"

    # Check if the destination directory exists
    if [ ! -d "$dest_dir" ]; then
        echo "⚠️ Warning: Destination directory '$dest_dir' not found."
        echo "No addons were copied."
        return 1
    fi

    cp -R "$src_dir"* "$dest_dir"

    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "✅ Addons successfully copied to '$dest_dir'."
    else
        echo "❌ Error: Failed to copy addons to '$dest_dir'."
        return 1
    fi
}

# Check command-line arguments
if [ $# -lt 1 ]; then
    usage
fi

# Perform actions based on game version
game_version=$1
if [ "$game_version" = "classic" ] || [ "$game_version" = "retail" ]; then
    copy_addons "$(convert_to_unix_path "${wow_install_directory}/_${game_version}_")"
else
    usage
fi