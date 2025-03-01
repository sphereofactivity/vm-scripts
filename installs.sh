#!/bin/bash

# ecit if any command fails
set -e 

#update and upgrade the system before installing to make sure most update version is in use.
sudo apt-get update && upgrade -y

sleep 5

#install git
sudo apt install git -y

sleep 5

# clone vim 
git clone https://github.com/vim/vim.git

# cd into the folder containing the build
cd vim/src

# build vim and print error log if error occurs.
if ! make 2>make_error.log; then
    echo "Vim install has failed."
    cat make_error.log
    exit 1
fi

# if vim successfully installs, print to state it was installed.
echo "Vim has been installed."