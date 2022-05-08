# 🌙
# export MOON=$(curl -s wttr.in?format="%m")

# Cursor

PS1_RESET='\033[0m'
PS1_BG='\033[47m'
PS1_FG='\033[0;30m'
TRIANGLE_SYMBOL=$'\uE0B0'
#export PS1="$PS1_FG$PS1_BG\w$PS1_RESET$TRIANGLE_SYMBOL "
export PS1=" \[\e[32m\]\w\[\e[m\] "

# Fun colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Use GitHub's fancy 'hub' instead of 'git'
eval "$(hub alias -s)"

# Use nVim for Git (and more!)
export VISUAL=nvim
export EDITOR=nvim

# Aliases
alias bat='batcat --theme="base16"'
alias clock='date +"%I:%M %p"; date "+%Y-%m-%d"'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pm="python manage.py $@"
alias goodbye='shutdown now'
alias js='nodemon -q -x "clear;node"'
alias ls='ls -1 --color --group-directories-first --literal'
alias mirror='xrandr --output eDP-1 --output HDMI-1 --output DP-1 --same-as HDMI-1'
alias mongosh='mongosh --quiet' # Turn off annoying mongosh warnings
alias moon='curl -s wttr.in?format="%m"; echo;'
alias open="xdg-open $@"
alias ssh="kitty +kitten ssh"
alias tree="tree --dirsfirst -I node_modules -I __pycache__"
alias v="nvim $@"
alias weather='curl -s wttr.in/Austin?u | head -n 17'

# Clipboard
alias yank='xclip -selection clipboard'
alias splat='xclip -selection clipboard -o'

# CD Changer
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Config Betterrr
config() {
  if   [ $1 = "bash" ];  then nvim "$HOME/.bashrc";
  elif [ $1 = "bat"  ];   then nvim "$HOME/.config/bat/config";
  elif [ $1 = "kitty"]; then nvim "$HOME/.config/kitty/kitty.conf";
  elif [ $1 = "tmux" ];  then nvim "$HOME/.tmux.conf";
  elif [ $1 = "nvim" ];  then nvim "$HOME/.config/nvim/init.vim";
  else echo "No config for $1 😿"; fi;
}

# Allow vi editing mode!
# Note the ~/.inputrc configuration
set -o vi

# Don't allow clobbering
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o noclobber

# Spell checking for `cd` command
shopt -s cdspell

# Add `nvim` to PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Rust to PATH
export PATH="$PATH:~/.cargo/bin"

# Add `.local/bin` to PATH
export PATH="$PATH:~/.local/bin/"

# Add `~/bin` to PATH
export PATH="$PATH:~/bin/"

# For `virtualenvwrapper`
export WORKON_HOME='~/.python-virtual-environments'
export PROJECT_HOME='~/code/python'
source /usr/local/bin/virtualenvwrapper.sh

# All good! nyan!
if [ $TERM = "xterm-kitty" ]; 
  then kitty +kitten icat --align left ~/pop/pics/nyan.png
  else echo "Meow 🌈🐱✨";
fi;
