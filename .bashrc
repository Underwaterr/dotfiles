# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# 🌙
#export MOON=$(curl -s wttr.in?format="%m")

# Cursor
if [ $HOSTNAME == 'debbie-harry' ]; then
  PS1_EMOJI='📻🎶'
elif [ $HOSTNAME == 'owl-house' ]; then
  PS1_EMOJI='🦉🏠'
elif [ $HOSTNAME == 'fairy-boots' ]; then
  PS1_EMOJI="🧚👢"
elif [ $HOSTNAME == 'astro-alloy' ]; then
  PS1_EMOJI="☽☿️"
fi

PS1_RESET='\033[0m'
PS1_BG='\033[47m'
PS1_FG='\033[0;30m'
TRIANGLE_SYMBOL=$'\uE0B0'
#export PS1="$PS1_FG$PS1_BG\w$PS1_RESET$TRIANGLE_SYMBOL "
export PS1="$PS1_EMOJI \[\e[32m\]\w\[\e[m\] "

# Add Git Branch to prompt!
#source ~/.git-prompt.sh
#export PS1="$(__git_ps1 '(%s)')\n$PS1_EMOJI \[\e[32m\]\w\[\e[m\] "

# Fun colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Use GitHub's fancy 'hub' instead of 'git'
# eval "$(hub alias -s)"

# Use nVim for Git (and more!)
export VISUAL=nvim
export EDITOR=nvim

# Aliases
alias :q="exit" # teehee
alias bat='batcat --theme="base16"'
alias clock='date +"%I:%M %p"; date "+%Y-%m-%d"'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ffmpeg='ffmpeg -hide_banner'
alias filesize='du -B G -d 1'
alias goodbye='echo "goodbye!"; shutdown now'
alias js='nodemon -q -x "clear;node"'
alias l='ls -1 --color --group-directories-first --literal'
alias la='ls -a -1 --color --group-directories-first --literal'
alias ls='ls -1 --color --group-directories-first --literal' # --hyperlink=auto
alias moon='curl -s wttr.in?format="%m"; echo;'
alias mv="mv -vi" # ask before overwriting a file!
alias open="xdg-open"
alias please="sudo apt"
alias pm="python manage.py"
alias reset-audio="pulseaudio -k"
alias server="python3 -m http.server $1"
alias ssh="kitty +kitten ssh" # Fix SSH for Kitty
alias tree="tree -I node_modules -I __pycache__ --dirsfirst "
alias v="nvim"
alias vv="view -M" # view read-only in vim
alias weather='curl -s wttr.in/Philadelphia?u | head -n 17'
alias book="vim -c ':VimwikiIndex 2'"
alias diary="vim -c ':VimwikiMakeDiaryNote 2'"
alias ns="npm start"
alias htop="btop"
alias fd="fdfind"

tartar() {
  tar --create --file $1 -C $2 . --verbose
}
untar() {
  tar --extract --file $1 --keep-old-files --verbose 
}

search() {
  echo "grep -R --exclude-dir=node_modules/ -n --color -e $1"
  grep -R --exclude-dir=node_modules/ -n --color -e "$1"
}

wiki() {
  vim -c :VimwikiIndex"$1" 
}

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
  if   [ $1 = "bash"  ];  then nvim "$HOME/.bashrc";
  elif [ $1 = "bat"   ];  then nvim "$HOME/.config/bat/config";
  elif [ $1 = "kitty" ];  then nvim "$HOME/.config/kitty/kitty.conf";
  elif [ $1 = "tmux"  ];  then nvim "$HOME/.tmux.conf";
  elif [ $1 = "nvim"  ];  then nvim "$HOME/.config/nvim/init.lua";
  elif [ $1 = "vim"   ];  then nvim "$HOME/.config/nvim/init.lua";
  else echo "No config for $1 😿"; fi;
}

# Find!
greg() {
  find . | grep $1
}

# Allow vi editing mode!
# Note the ~/.inputrc configuration
set -o vi

# Don't allow clobbering
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o noclobber

# Extended Globbing operators
shopt -s extglob

# automatically go to directory without `cd`!
# surprise, turns out this causes HARD TO FIND BUGS!
# shopt -s autocd

# Add `nvim` to PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Rust to PATH
#export PATH="$PATH:~/.cargo/bin"

# Something else with Rust
#. "$HOME/.cargo/env"

# Add `.local/bin` to PATH
export PATH="$PATH:~/.local/bin/"

# Add `~/bin` to PATH
export PATH="$PATH:~/bin/"

# Add Swift to PATH
export PATH="$PATH:/usr/local/swift/bin"

# Add DuckDB to PATH
export PATH='/home/t/.duckdb/cli/latest':$PATH

# All good! nyan!
if [ $TERM = "xterm-kitty" ]; 
  then kitty +kitten icat --align left ~/.splash.png
  else echo "Meow 🌈🐱✨";
fi;


# danger zonnne
# in theory, <CR> will do `ls`
command1()
{
    if [ "$BASH_COMMAND" != command2 ]
    then
        command_flag=1
    fi
    return 0
}
trap command1 debug
command2()
{
    if [ ! "$command_flag" ]
    then
        ls
    fi
    command_flag=
}
PROMPT_COMMAND=command2

# custom SUDO prompt
export SUDO_PROMPT="sudo incantation: "

# Volta!
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Composer! (for PHP)
export PATH="/home/t/.config/composer/vendor/bin:$PATH"
