#/bin/bash

platform=$(uname | tr '[:upper:]' '[:lower:]')

if [[ -f "install-${platform}.sh" ]]
    then ./"install-${platform}.sh"
    else echo "Unsupported ${platform} platform."; exit 1
fi
