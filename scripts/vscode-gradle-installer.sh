#!/bin/sh
# Installs vscode-gradle and moves it for lspconfig usage.

set -e

EXTENSION_DIR="vscode-gradle"
REPO_URL="https://github.com/microsoft/vscode-gradle"
NVIM_EXT_DIR="$HOME/.dotfiles/neovim/.config/nvim/bin/$EXTENSION_DIR"

printf "\n\n[1] Removing existing installation in %s...\n\n" "$NVIM_EXT_DIR"
rm -Rf "$NVIM_EXT_DIR"

printf "\n\n[2] Cloning repo into %s...\n\n" "$NVIM_EXT_DIR"
mkdir -p "$NVIM_EXT_DIR"
git clone $REPO_URL "$NVIM_EXT_DIR"

printf "\n\n[3] Installing with Gradle...\n\n"
cd "$NVIM_EXT_DIR"
./gradlew installDist

printf "\n\n[4] Success! Executable should be one of the following binaries:\n\n"
find . -name gradle-language-server
