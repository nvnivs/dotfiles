#!/bin/bash
set -e

# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt install -y zsh

# https://www.vim.org/
sudo apt install -y vim

# https://github.com/sharkdp/bat
sudo apt install -y bat

# https://github.com/jqlang/jq
sudo apt install -y jq

# https://www.gnu.org/software/wget/
sudo apt install -y wget

# https://gnupg.org/
sudo apt install -y gpg

# https://www.gnu.org/software/stow/
sudo apt install -y stow

# https://htop.dev/
sudo apt install -y htop

# https://manpages.debian.org/unstable/apt/apt-transport-https.1.en.html
sudo apt install -y apt-transport-https

# fzf: A command-line fuzzy finder
# https://github.com/junegunn/fzf
sudo apt install -y fzf

# yq: A portable command-line YAML, JSON, XML, CSV, TOML and properties processor
# https://github.com/mikefarah/yq
sudo apt install -y yq

# xq: Command-line XML and HTML beautifier and content extractor
# https://github.com/sibprogrammer/xq
sudo apt install -y xq

# pre-commit: A framework for managing and maintaining multi-language pre-commit hooks.
# https://pre-commit.com/
sudo apt install -y pre-commit

# https://www.digitalocean.com/community/tutorials/install-chrome-on-linux-mint
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt update
sudo apt install -y google-chrome-stable

# https://github.com/microsoft/vscode
# needs: wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f /tmp/packages.microsoft.gpg
sudo apt update
sudo apt install -y code

# Rancher desktop
# https://docs.rancherdesktop.io/getting-started/installation/#linux
curl -s https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/Release.key | gpg --dearmor | sudo dd status=none of=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/isv-rancher-stable-archive-keyring.gpg] https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/ ./' | sudo dd status=none of=/etc/apt/sources.list.d/isv-rancher-stable.list
sudo apt update
sudo apt install rancher-desktop

# https://github.com/casey/just
rm -rf ~/.local/bin/just
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin

# https://docs.dagger.io/
curl -fsSL https://dl.dagger.io/dagger/install.sh | BIN_DIR=$HOME/.local/bin sh
