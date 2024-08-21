#/bin/bash

apt_install() {
    if [ ! $(which ${1}) ]; then
        sudo apt install ${1}
    fi
}

# https://github.com/sharkdp/bat
if [ ! $(which bat) ]; then
    apt_install "bat"
    mkdir -p ~/.local/bin
    sudo ln -s /usr/bin/batcat /usr/local/bin/bat
fi

# https://github.com/jqlang/jq
apt_install "jq"

# https://www.gnu.org/software/wget/
apt_install "wget"

# https://gnupg.org/
apt_install "gpg"

# https://manpages.debian.org/unstable/apt/apt-transport-https.1.en.html
apt_install "apt-transport-https"

# https://github.com/microsoft/vscode
# needs: wget gpg apt-transport-https
if [ ! $(which codeAAA) ]; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    rm -f /tmp/packages.microsoft.gpg

    sudo apt update
    sudo apt install code
fi
