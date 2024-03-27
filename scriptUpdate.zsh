#!/bin/zsh
#This is a script that allows me to update package not installed with the apt command such as neovim and starship

# Basic system update && clean
sudo apt update
sudo apt full-upgrade
sudo apt autoremove
sudo apt autoclean
sudo apt clean

# We work from the ~/Downloads/
cd ~/Downloads/

# Neovim update
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage && mv nvim.appimage nvim
sudo mv nvim /usr/local/bin
if [ $? -eq 0 ]; then
    echo "Neovim updated and moved correctly"
else
    rm nvim*
    echo "Issue updating Neovim"
fi

# Starship update
curl -sS https://starship.rs/install.sh | sh
if [ $? -eq 0 ]; then
    echo "Starship updated and moved correctly"
else
    echo "Issue updating Starship"
fi

cd ~
