# Mise à jours après installation
sudo apt update -y
sudo apt upgrade -y

# Font, FantasqueSanMono
# Depuis le site https://www.nerdfonts.com/font-downloads
# Ou via wget
wget -P ~/Téléchargements/font https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip 
unzip ~/Téléchargements/font/FantasqueSansMono.zip

# On vérifie si le dossier existe déjà ou pas
if [ ! -d "~/.local/share/fonts/" ]
then
  mkdir ~/.local/share/fonts
fi

cp ~/Téléchargements/font/* ~/.local/share/fonts
#Ensuite il faut manuellement sélectionné la font dans le terminal de ton choix TODO: On peut pas l'automatiser ? En vérifiant le terminal par défaut ?

# Fais en sorte que les ficheirs de configurations des programmes se mettent dans .config
export XDG_CONFIG_HOME="$HOME/.config"

## Installation des drivers Nvidia
sudo apt install nvidia-driver -y

## Installation Chromium
sudo apt install apt install chromium chromium-l10n -y

## Installation et activation zsh
# Où installer les fichiers de config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
sudo apt install zsh -y
wget -P ~/.config/ https://raw.githubusercontent.com/VongoSanDi/dotfiles/master/aliases
chsh -s $(which zsh)
# Tuto https://thevaluable.dev/zsh-install-configure-mouseless/

## Installation overlay informations système
cd Téléchargements/
wget https://github.com/aaaaadrien/perso-gnome-extension
./perso-gnome-extension/install.sh
gnome-shell-extension-tool -e perso-adrien

## Installation nodejs + npm
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo bash -
sudo apt install -y nodejs

## Installation yarn
sudo npm install -g yarn

## Installation Vue
sudo yarn global add @vue/cli

## Ajout du path de yarn
export PATH="$PATH:$(yarn global bin)"

## Ajout de Golang
https://golang.org/doc/install

## Installation nvim
https://github.com/neovim/neovim/releases
# Ne pas oublier d'ajouter les droits, puis renommer en juste nvim, puis déplacer vers /usr/local/bin

## Lazygit
# Récupéré la dernière version depuis https://github.com/jesseduffield/lazygit/tags
#puis extraire puis copier l'appimage dans /usr/local/bin
#fermez/rouvrir le terminal
