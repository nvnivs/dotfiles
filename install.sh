#/bin/bash
set -e

platform=$(uname | tr '[:upper:]' '[:lower:]')

# https://github.com/ohmyzsh/ohmyzsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Platform specific installer
if [ -f "install-${platform}.sh" ]
    then ./"install-${platform}.sh"
    else echo "Unsupported ${platform} platform."; exit 1
fi
