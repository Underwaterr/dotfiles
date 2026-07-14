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
# `wiki 2` takes you to the second, etc.
wiki() {
  nvim -c :VimwikiIndex"$1" 
}

todo() {
  nvim -c ':VimwikiMakeDiaryNote 2'
}

lazy() {
  git add -A;
  git commit --allow-empty-message -m "";
  git push origin main
}

morning() {
  TZ=America/New_York
  local file="$HOME/apps/vimwiki/morning-pages/$(date +%Y-%m-%d).wiki"
  if [[ ! -f "$file" ]]; then
    printf '%s\n\n\n' "$(date +'%Y-%m-%d')" > "$file"
  fi
  # run NeoVim on insert mode at the end of the file
  nvim '+' -c 'startinsert' -c 'TimerStart 10m Morning' "$file"
}

# Checks if we really want to shut down if we're inside an SSH session
# (to avoid accidentally turning off the wrong computer!)
shutdown() {
  if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
    echo "⚠  You are in an SSH session on: $(hostname)"
    read -rp "Shut down this REMOTE machine? Type 'yes' to confirm: " confirm
    if [[ "$confirm" != "yes" ]]; then
      echo "Shutdown aborted."
      return 1
    fi
  fi
  command sudo /sbin/shutdown "$@"
}

# handles both macOS and Linux
open() {
  if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$@"
  else
    command open "$@"
  fi
}
