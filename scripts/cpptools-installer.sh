#!/bin/sh
# Installs vscode-cpptools and modifies it for nvim-dap usage.

DOWNLOAD_URL="https://github.com/microsoft/vscode-cpptools/releases/download/1.7.1/cpptools-linux.vsix"
ZIP_NAME="cpptools-linux.vsix"
EXTENSION_DIR="cpptools"

NVIM_OUTPUT_DIR="$HOME/.dotfiles/neovim/.config/nvim/bin/$EXTENSION_DIR"

printf "\n\n [1] Downloading %s...\n\n" "$ZIP_NAME"
wget "$DOWNLOAD_URL"

printf "\n\n [2] Unzipping...\n\n"
unzip "$ZIP_NAME" -d "$EXTENSION_DIR"

printf "\n\n [3] Modifying configuration for nvim-dap usage...\n\n"

cp "$EXTENSION_DIR/extension/cppdbg.ad7Engine.json" "$EXTENSION_DIR/extension/debugAdapters/bin/nvim-dap.ad7Engine.json"
chmod +x "$EXTENSION_DIR/extension/debugAdapters/bin/OpenDebugAD7"

printf "\n\n [4] Moving files to:    %s ...\n\n" "$NVIM_OUTPUT_DIR"
mv "$EXTENSION_DIR" "$NVIM_OUTPUT_DIR"

printf "\n\n [5] Cleaning up...\n\n"
rm "$ZIP_NAME"

printf "\n\n [6] Success! Extension setup in:   %s \n\n" "$NVIM_OUTPUT_DIR"
