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

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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
alias py='bpython'
alias t='tmux'
alias tls='tmux list-sessions'
alias ts='tmux switch-client -t'
alias ta='tmux attach-session -t'
alias tka='tmux kill-server'
alias tk='tmux kill-session -t'
alias r='ranger'
alias dw='bash ~/.config/scripts/set-double-display-warmer.sh'
alias dn='bash ~/.config/scripts/set-double-display-normal.sh'
alias sw='bash ~/.config/scripts/set-single-display-warmer.sh'
alias sn='bash ~/.config/scripts/set-single-display-normal.sh'
alias l='bash ~/.config/scripts/leetcode/create_solution_file.sh'
alias lg='bash ~/.config/scripts/leetcode/add_leetcode_problem_to_website.sh'
# alias c='bash ~/.config/scripts/c/compile.sh'
alias c='gcc -Wall -Wextra -lm main.c
./a.out'
alias za='cd ~/Documents/github/zedsalim/arch-z/'
alias sts='git status'
alias add='git add .'
alias cmt='git commit -m'
alias push='git push'
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias up='fusermount -u ~/phone_mount'
alias mp='jmtpfs ~/phone_mount'
alias caps='setxkbmap -option "caps:escape"'
alias speed='xset r rate 300 50'
alias 9='timer 90'
alias chat='cd ~/Downloads/chat/ && source venv/bin/activate && python app.py'
alias md='cd ~/Documents/moodle-scraper/ && source venv/bin/activate && python main.py && deactivate'
alias dls='docker ps -a'
alias ser='ssh server@192.168.1.202'
# alias prox='ssh root@192.168.1.201'
alias bat='ssh -n -q server@192.168.1.202 bat'
alias cpu='ssh -n -q server@192.168.1.202 sensors'
alias sw='/bin/bash /mnt/FILES/My_Stuff/rsync_win.sh'
alias sl='/bin/bash /mnt/FILES/My_Stuff/rsync_linux.sh'
alias soff='ssh -n -q server@192.168.1.202 "sudo shutdown now"'
alias sreb='ssh -n -q server@192.168.1.202 "sudo reboot"'
alias js='v "/mnt/FILES/Watch/Programming/WebDev/El Zero/Javascript/Practice/main.js"'
alias wp='cd /home/zed/docker/wordpress && docker-compose up'
alias lp='cd /home/zed/docker/lamp/ && docker-compose up'
alias p='jmtpfs ~/phone_mount && sleep 2 && fusermount -u ~/phone_mount && jmtpfs ~/phone_mount && rsync -avr --progress ~/phone_mount/Phone/DCIM/p /mnt/FILES/Watch/Programming/WordPress/Images/Phone'
ufetch
##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f ~/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
    source ~/.config/synth-shell/synth-shell-prompt.sh
fi


cmg() {
    git add .
    git commit -m "$1"
}
lzg() {
    git add .
    git commit -m "$1"
    git push
}

fc() { du -a ~/.config/* | awk '{print $2}' | fzf | xargs -r $EDITOR;}

export EDITOR=nvim
export BROWSER=chromium
