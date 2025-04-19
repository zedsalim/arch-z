# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='exa -a --icons --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
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

alias du='du -hd 1'
alias al='nvim ~/.bashrc'
alias alu='source ~/.bashrc'
alias ll='ls -l'
alias la='ls -a'
alias mkdir='mkdir -p'
alias df='df -h'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias v='nvim'
alias vf='vifm'
alias vfi='vifm .'
alias h='htop'
alias py='python'
alias t='tmux'
alias tls='tmux list-sessions'
alias ts='tmux switch-client -t'
alias ta='tmux attach-session -t'
alias tka='tmux kill-server'
alias tk='tmux kill-session -t'
alias dw='bash ~/.config/scripts/set-double-display-warmer.sh'
alias dn='bash ~/.config/scripts/set-double-display-normal.sh'
alias sw='bash ~/.config/scripts/set-single-display-warmer.sh'
alias sn='bash ~/.config/scripts/set-single-display-normal.sh'
alias sts='git status'
alias pi='sudo pacman -S'
alias py='sudo pacman -Sy'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -Rns'
alias up='fusermount -u ~/phone_mount'
alias mp='jmtpfs ~/phone_mount'
alias caps='setxkbmap -option "caps:escape_shifted_capslock"'
alias speed='xset r rate 300 50'
alias dls='docker ps -a'
alias p='jmtpfs ~/phone_mount && sleep 2 && fusermount -u ~/phone_mount && jmtpfs ~/phone_mount && rsync -avr --progress ~/phone_mount/Phone/DCIM/p /mnt/FILES/Watch/Programming/WordPress/Images/Phone'
alias rlw='rsync -avu --progress /mnt/FILES/ /mnt/sdb2/Users/Salim/Documents/FILES/'
alias dn='/bin/bash /home/zed/.config/scripts/set-double-display-normal.sh'
alias dw='/bin/bash /home/zed/.config/scripts/set-double-display-warmer.sh'
alias sn='/bin/bash /home/zed/.config/scripts/set-single-display-normal.sh'
alias sw='/bin/bash /home/zed/.config/scripts/set-single-display-warmer.sh'

~/.config/scripts/ufetch
##-----------------------------------------------------

cmg() {
    git add .
    git commit -m "$1"
}
lzg() {
    git add .
    git commit -m "$1"
    git push
}

extract () {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1" ;;
            *.tar.gz)    tar xvzf "$1" ;;
            *.tar.xz)    tar xvJf "$1" ;;
            *.tar.zst)   unzstd --stdout "$1" | tar xvf - ;;
            *.tar.lz4)   lz4 -d "$1" | tar xvf - ;;
            *.tar)       tar xvf "$1" ;;
            *.tbz2)      tar xvjf "$1" ;;
            *.tgz)       tar xvzf "$1" ;;
            *.zip)       unzip "$1" ;;
            *.rar)       unrar x "$1" ;;
            *.7z)        7z x "$1" ;;
            *.gz)        gunzip "$1" ;;
            *.bz2)       bunzip2 "$1" ;;
            *.xz)        unxz "$1" ;;
            *.zst)       unzstd "$1" ;;
            *.lz4)       lz4 -d "$1" "${1%.lz4}" ;;
            *.tar.lz)    lzip -d -c "$1" | tar xvf - ;;
            *)           echo "❌ Cannot extract '$1' — unknown format." ;;
        esac
    else
        echo "'$1' is not a valid file."
    fi
}

fc() { du -a ~/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR;}

export EDITOR=nvim
export BROWSER=firefox

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin

eval "$(starship init bash)"
