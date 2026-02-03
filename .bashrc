# skip this script if the shell is not interactive!
case $- in
    *i*) ;;
    *) return;;
esac

# Map $HOSTNAME to an emoji pair for our prompt!
if   [ $HOSTNAME == 'debbie-harry'       ]; then PS1_EMOJI='📻🎶'
elif [ $HOSTNAME == 'owl-house'          ]; then PS1_EMOJI='🦉🏠'
elif [ $HOSTNAME == 'fairy-boots'        ]; then PS1_EMOJI="🧚👢"
elif [ $HOSTNAME == 'astro-alloy'        ]; then PS1_EMOJI="🌌🌠"
elif [ $HOSTNAME == 'amphibia'           ]; then PS1_EMOJI='🐸⚔️'
elif [ $HOSTNAME == 'gravity-falls'      ]; then PS1_EMOJI='🌲🌙'
elif [ $HOSTNAME == 'garfield-solutions' ]; then PS1_EMOJI='😼🧸'
fi

# Our prompt is `emoji pair` then the current working directory
export PS1="$PS1_EMOJI \[\e[32m\]\w\[\e[m\] "

# Enable fun colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Use NeoVim as our default editor
export VISUAL=nvim
export EDITOR=nvim

# custom SUDO prompt
export SUDO_PROMPT="🔮 sudo incantation: "

# Allow vi editing mode
# (Note we have a corresponding `~/.inputrc` configuration)
set -o vi

# Don't allow clobbering
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o noclobber

# Extended Globbing operators
shopt -s extglob


# Source all scripts in ~/.bashrc.d/
if [ -d "$HOME/.bashrc.d" ]; then
    for script in "$HOME/.bashrc.d/"*; do
        if [ -f "$script" ] && [ -r "$script" ]; then
            source "$script"
        fi
    done
fi


# Use bash-completion, if available, and avoid double-sourcing
[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion


# All good! nyan!
if [ $HOSTNAME == 'garfield-solutions' ]; then cat ~/.garf;
elif [ $TERM = "xterm-kitty" ]; then kitty +kitten icat --align left ~/.splash.png;
else echo "Meow 🌈🐱✨";
fi;
