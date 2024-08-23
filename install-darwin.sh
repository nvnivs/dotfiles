#!/bin/bash
set -e

# https://github.com/Homebrew/brew
if [[ ! $(which brew) ]]
    then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else brew update
fi

# https://github.com/sharkdp/bat
brew install bat

# https://github.com/jqlang/jq
brew install jq

# https://www.gnu.org/software/stow/
brew install stow

# https://github.com/gnachman/iTerm2
brew install --cask iterm2

# https://github.com/microsoft/vscode
brew install --cask visual-studio-code
