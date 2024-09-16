#!/bin/bash
set -e

# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt install -y zsh

# https://www.vim.org/
sudo apt install -y vim

# https://github.com/sharkdp/bat
sudo apt install -y bat
mkdir -p ~/.local/bin
if [[ ! -f /usr/local/bin/bat ]]; then
    sudo ln -s /usr/bin/batcat /usr/local/bin/bat
fi

# https://github.com/jqlang/jq
sudo apt install -y jq

# https://www.gnu.org/software/wget/
sudo apt install -y wget

# https://gnupg.org/
sudo apt install -y gpg

# https://www.gnu.org/software/stow/
sudo apt install -y stow

# https://manpages.debian.org/unstable/apt/apt-transport-https.1.en.html
sudo apt install -y apt-transport-https

# https://github.com/microsoft/vscode
# needs: wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f /tmp/packages.microsoft.gpg
sudo apt update
sudo apt install code

# https://github.com/casey/just
rm -rf ~/.local/bin/just
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin

# https://docs.dagger.io/
curl -fsSL https://dl.dagger.io/dagger/install.sh | BIN_DIR=$HOME/.local/bin sh
