# Config Betterrr
config() {
  if   [ $1 = "bash"  ];  then nvim "$HOME/.bashrc";
  elif [ $1 = "bat"   ];  then nvim "$HOME/.config/bat/config";
  elif [ $1 = "kitty" ];  then nvim "$HOME/.config/kitty/kitty.conf";
  elif [ $1 = "tmux"  ];  then nvim "$HOME/.tmux.conf";
  elif [ $1 = "nvim"  ];  then nvim "$HOME/.config/nvim/init.lua";
  elif [ $1 = "vim"   ];  then nvim "$HOME/.config/nvim/init.lua";
  else echo "No config for $1 😿"; fi;
}

# idk about this one...
wiki() {
  nvim -c :VimwikiIndex"$1" 
}
