# Aliases

# CD Changer
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Vim stuff
alias v="nvim"
alias vim="nvim"
alias vv="view -M" # for read-only
alias :q="exit" # teehee

# if Eza installed, use that instead of `ls`
if command -v eza >/dev/null 2>&1
then alias ls='eza -1 --icons --group-directories-first'; fi

# if using kitty terminal, use their "kitten" to fix SSH
if [ $TERM == 'xterm-kitty' ]
then alias ssh="kitty +kitten ssh"; fi

alias bat='batcat --theme="base16" --style=plain'
alias clear='clear && printf "\033[3J"'
alias clock='date +"%I:%M %p"; date "+%Y-%m-%d"'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias open="xdg-open"
alias server="python3 -m http.server $1"
alias tree="tree -I node_modules -I __pycache__ --dirsfirst "
alias weather='curl -s wttr.in/Philadelphia?u | head -n 17'

# ask before overwriting a file!
alias mv="mv -vi" 
