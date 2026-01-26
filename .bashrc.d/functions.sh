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

# `wiki` takes you to the first wiki
# `wiki 1` takes you to the second, etc.
wiki() {
  nvim -c :VimwikiIndex"$1" 
}

lazy() {
  git add -A;
  git commit --allow-empty-message -m "";
  git push origin main
}
