#!/usr/bin/env bash

# This script will ask a user to select a location for a project from a list
# of paths. When the user has selected a location, the script will prompt the
# user to select a language from a list of supported languages and a nam for
# the project.

usage() {
    echo "Usage: create-new-project.sh [--location <location>]"
    echo "[--language <language>] [--project-name <project-name>]"
    echo "  --location <location>     The location where the project will be created."
    echo "  --language <language>     The programming language of the project."
    echo "  --project-name <name>     The name of the project."
    exit 1
}

project_location=""
programming_language=""
project_name=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
    --project-location)
        project_location="$2"
        shift
        shift
        ;;
    --programming-language)
        programming_language="$2"
        shift
        shift
        ;;
    --project-name)
        project_name="$2"
        shift
        shift
        ;;
    *)
        usage
        ;;
    esac
done

# Ensure fzf is installed
if ! command -v fzf &>/dev/null; then
    echo "Error: fzf is not installed. Please install it and try again."
    exit 1
fi

# Define the root folder containing the language subfolders
ROOT_FOLDER=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# If location is not provided as an argument, use fzf to ask the user to select
# a location from a list of paths
if [[ -z $project_location ]]; then
    project_location="$(eval realpath "$(fzf --prompt="Select a project location: " < ~/dotfiles/personal/.tmux-code-locations)")"
fi

# Find all supported languages
scripts=$(find "$ROOT_FOLDER" -type f -name "setup-project-*.sh")
languages="$(basename -a "$(dirname "$scripts")")"

# If a language is provided as an argument, check if it is supported
if [[ -n $programming_language ]]; then
    if ! echo "$languages" | grep -q "$programming_language"; then
        echo "Error: Language '$programming_language' is not supported."
        exit 1
    fi
else
    selected_language=$(echo "$languages" | fzf --prompt="Select a language: ")
fi

# Construct the script path
selected_script="$ROOT_FOLDER/$selected_language/setup-project-$selected_language.sh"

# Check if the script exists
if [[ ! -f "$selected_script" ]]; then
    echo "Error: Script '$selected_script' not found."
    exit 1
fi

# Prompt for input
read -rp "Enter the name of the project: " project_name

# Execute the selected script
$selected_script "--project-name" "$project_name" "--project-location" "$project_location"
 
