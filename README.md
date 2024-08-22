# dotfiles

A dotfiles repository to manage the installation of tools and configuration.

## How to use

Run the following commands to setup on your local machine. This repository must be checked out into you home directory.

```bash
    # Go to home directory
    cd ~

    # Clone this repo
    git clone https://github.com/nvnivs/dotfiles.git

    # Change to checked out directory
    cd ~/dotfiles

    # Execute installer
    ./install.sh

    # Execute configure
    ./configure.sh
```

## Customize `.zshrc`

Customizations to `.zshrc` for machine specific settings can be added by creating a `.zshrc_custom` file in the home directory.

It's contents will not be overwritten.
