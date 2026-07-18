# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# History stuffs
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# export PATH=$PATH:/usr/games
eval "$(starship init bash)"





# USER SCRIPTS

# PS1="\e[32m\\u@\\h:\e[34m\\w\e[0m\\$ "

# PS1="\e[30m\e[44m \\u \e[32m\e[7m \\w \e[0m "
# PS1="\e[32m\e[7m \\w \e[27m\e[0m "
# PS1="\e[32m█\e[7m \\w \e[27m█\e[0m "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


### Custom User Command Aliases
alias ls='exa --icons=always'
alias lah='ls -lah'
alias neofetch='fastfetch'
alias python='python3'
alias icat="kitten icat"
alias diff='diff --color=always --unified'
alias rm='trash -v'
alias nmtui="NEWT_COLORS=\$(tr '\n' ' ' < ~/.nmtui-palette) nmtui"
alias open=xdg-open
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dua='du -ah -d1 | sort -hr'
alias cdj='cd "$(fd -HL --type d | fzf-tmux -p)"'
alias bashrc='nvim ~/.bashrc'
alias source-bashrc='source ~/.bashrc'
alias source-tmux='tmux source-file ~/.tmux.conf'
alias config-nvim='cd ~/.config/nvim/ && tree'
alias config-tmux='nvim ~/.tmux.conf'
alias config-hypr='cd ~/.config/hypr/ && tree'
alias browse="find -not -executable | fzf --preview='bat --color=always {}'"
alias fuzzy='browse | xargs -r nvim'

# Usage of alias `clip`
# --------------------------------
# echo "..." | clip
# --------------------------------
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    alias clip='wl-copy'
else
    alias clip='xclip -sel clip'
fi

# Usage of alias `bak`
# (toggle .bak suffix on file)
# --------------------------------
# bak file       file -> file.bat
# bak file.bak   file.bat -> file
# --------------------------------
bak() {
    if [ -z "$1" ]; then
        echo "Usage: bak <filename_or_folder>"
        return 1
    fi

    local target="${1%/}"    # Strip trailing slashes (e.g., "myfolder/" becomes "myfolder")

    if [ ! -e "$target" ]; then
        echo "Error: '$target' does not exist."
        return 1
    fi

    if [[ "$target" == *.bak ]]; then
        local dest="${target%.bak}"
        if [ -e "$dest" ]; then
			# Makes sure restoration doesn't overwrite a non-bak file
            echo "Error: Cannot restore, '$dest' already exists."
            return 1
        fi
        mv -- "$target" "$dest" && echo "$target-> $dest"
    else
        mv -- "$target" "$target.bak" && echo "$target-> $target.bak"
    fi
}

paclist() {
    for i in "$@"; do
        # pacman -Si "$i" | grep "Description" | awk '{printf "$i";printf ": " ;$1=""; $2="";  sub(/^  /, ""); print}'
        pacman -Si $i | grep "Description" | awk -v pac="$i" '{$1=pac; print}'
    done
}



bind '"\t":menu-complete' # Cycle through all possible tab completions
export EDITOR=nvim

# USEFUL COMMANDS
# acpi
# xrandr --verbose | grep Gamma
# xrandr --output eDP-1 --gamma 1.2:1.2:1.2
# du -sh


# SOME USEFUL BLOCK CHARACTERS

# │ ▌█▐
#  ╱╲
#  


# Even Better!: https://www.nerdfonts.com/cheat-sheet

. "$HOME/.local/bin/env"
