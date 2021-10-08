# XDG
export XDG_CONFIG_HOME="$HOME/.config"			 #Defini le dossier pour les fichiers de configurations
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share" 	 #Defini le dossier où les données spécifiques à l'utilisateurs doivent être
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache" 		 #Où les données non essentielles (mises en cache) spécifiques à l'utilisateur doivent être écrites

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" # Defini le dossier où trouver les fichiers de configurations de zsh
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
