#!/usr/bin/env bash

# This will setup everything for a new computer

# Detect OS and define the install function
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS: Use Homebrew
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Please install it first."
        exit 1
    fi
    install_package() {
        if brew list $1 &>/dev/null; then
            echo "$@ is already installed. Skipping..."
        else
            brew install "$@"
        fi
    }

elif [[ "$OSTYPE" == "linux"* ]]; then
    # Linux: Use apt
    if ! command -v apt &>/dev/null; then
        echo "apt is not available. This script supports apt-based systems (like Debian/Ubuntu)."
        exit 1
    fi
    sudo apt update
    install_package() {
        if $@ --version &>/dev/null; then
            echo "$@ is already installed. Skipping..."
        else
            sudo apt install -y "$@"
        fi
    }

else
    echo "Unsupported OS. This script supports only macOS and Linux."
    exit 1
fi

create_link() {
    if [ "$#" -ne 2 ]; then
        echo "Two arguments needed"
        exit 1
    fi

    source=$1
    dest=$2

    # check if link already exists
    if [ -L ${dest} ] ; then
        if [ -e ${dest} ] ; then
            echo "Symlink already exists. Skipping..."
            return
        else
            echo "Symlink, ${dest}, already exists, but is broken. Aborting..."
            exit 1
        fi
    fi

    ln -s "${source}" "${dest}"
}

# List of packages to install
PACKAGES=(
    tmux
    nvim
)

# Install each package in the list
for pkg in "${PACKAGES[@]}"; do
    echo "Installing $pkg..."
    install_package "$pkg"
done

# Create symlinks to link dotfiles

TOP=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

create_link $TOP/.config/tmux ~/.config/tmux
create_link $TOP/.config/nvim ~/.config/nvim

