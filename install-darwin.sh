#!/bin/bash
set -e

# https://github.com/Homebrew/brew
if [[ ! $(which brew) ]]
    then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else brew update
fi

# Install brew bundle
brew bundle install

# Remove outdated versions from the cellar.
brew cleanup
