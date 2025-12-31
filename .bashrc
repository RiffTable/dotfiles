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
HISTFILESIZE=2000

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
alias dua='du -ah -d1 | sort -hr'
alias cd..='cd ..'
alias cdj='cd "$(fd -HL --type d | fzf-tmux -p)"'
alias diff='diff --color=always --unified'

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    alias clip='wl-copy'
else
    alias clip='xclip -sel clip'
fi

alias bashrc='nvim ~/.bashrc'
alias source-bashrc='source ~/.bashrc'
alias source-tmux='tmux source-file ~/.tmux.conf'
alias config-nvim='cd ~/.config/nvim/ && tree'
alias config-tmux='nvim ~/.tmux.conf'
alias config-hypr='cd ~/.config/hypr/ && tree'

alias browse="find -not -executable | fzf --preview='bat --color=always {}'"
alias fuzzy='browse | xargs -r nvim'
alias rm='trash'
alias python='python3'
backup() {
    mkdir -p "$1.backup"
    cp -r $1/* $1.backup/
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
