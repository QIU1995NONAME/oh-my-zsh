#!/bin/zsh
ZSH_THEME_GIT_PROMPT_CLEAN="${fg_bold[yellow]}GIT"
ZSH_THEME_GIT_PROMPT_DIRTY="${fg_bold[yellow]}G${fg_bold[magenta]}IT"

ZSH_THEME_GIT_PROMPT_AHEAD="$fg_bold[white][A]$reset_color"
ZSH_THEME_GIT_PROMPT_STASHED="$fg_bold[blue]S"
ZSH_THEME_GIT_PROMPT_UNMERGED="$fg_bold[magenta]C"
ZSH_THEME_GIT_PROMPT_DELETED="$fg_bold[red]D"
ZSH_THEME_GIT_PROMPT_RENAMED="$fg_bold[cyan]R"
ZSH_THEME_GIT_PROMPT_MODIFIED="$fg_bold[yellow]M"
ZSH_THEME_GIT_PROMPT_ADDED="$fg_bold[green]A"
ZSH_THEME_GIT_PROMPT_UNTRACKED="$fg_bold[red]N"

precmd(){
    local Q_ERRNO=$?;
    ### PWD
    local PWD0=$PWD;
    echo $PWD | \grep "^$HOME" > /dev/null 2> /dev/null
    if [ $? -eq 0 ]; then
        PWD0="${PWD/$HOME/~}"
    fi
    ### GIT
    local __GIT_PREFIX="$(parse_git_dirty)$fg_bold[yellow]:[$fg_bold[cyan]"
    local __GIT_SUFFIX="$fg_bold[yellow]]$(git_prompt_status)"
    local __GIT__=$(__git_ps1 "${__GIT_PREFIX}%s${__GIT_SUFFIX}")
    ### SChroot
    local __SCHROOT__="";
    if [[ ! "x${SCHROOT_CHROOT_NAME}" == "x" ]]; then
        __SCHROOT__=" ${fg_bold[cyan]}S(${reset_color}${SCHROOT_CHROOT_NAME}${fg_bold[cyan]})"
    fi
    ### VirtualENV
    local __VIRTUALENV__="";
    if [[ ! "x${VIRTUAL_ENV}" == "x" ]]; then
        __VIRTUALENV__=" ${fg_bold[cyan]}V(${reset_color}${VIRTUAL_ENV##*/}${fg_bold[cyan]})";
    fi
    ### PROMPT
    ### [HOST:USER: PWD] G(GITSTATUS) S(SCHROOT) V(VIRTUALENV)
    ### [XxXX|DDDD]>                   DATE & TIME
    Q_PROMPT='';
    Q_PROMPT=${Q_PROMPT}"$fg_bold[cyan][";
    Q_PROMPT=${Q_PROMPT}"$fg_no_bold[green]${HOST}";
    Q_PROMPT=${Q_PROMPT}"$fg_bold[cyan]:";
    Q_PROMPT=${Q_PROMPT}"$reset_color$USER";
    Q_PROMPT=${Q_PROMPT}"$fg_bold[cyan]:";
    Q_PROMPT=${Q_PROMPT}" $fg_no_bold[cyan]$PWD0";
    Q_PROMPT=${Q_PROMPT}"$fg_bold[cyan]] ";
    Q_PROMPT=${Q_PROMPT}"${__GIT__}${__SCHROOT__}${__VIRTUALENV__}";
    echo $Q_PROMPT;
    PROMPT='';
    PROMPT=${PROMPT}"%{$fg_bold[yellow]%}[";
    PROMPT=${PROMPT}"%(?:%{$reset_color%}:%{$fg_no_bold[magenta]%})";
    PROMPT=${PROMPT}$(printf "0x%02X" $Q_ERRNO)
    PROMPT=${PROMPT}"%{$fg_bold[yellow]%}|";
    PROMPT=${PROMPT}"%(?:%{$reset_color%}:%{$fg_no_bold[magenta]%})";
    PROMPT=${PROMPT}$(printf "%04d" $Q_ERRNO);
    PROMPT=${PROMPT}"%{$fg_bold[yellow]%}]";
    PROMPT=${PROMPT}"%{$fg_bold[cyan]%}> %{$reset_color%}";
    RPROMPT="%{$fg_no_bold[green]%}$(date +'%Y/%m/%d %H:%M:%S')%{$reset_color%}";
}

### ALIAS 
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias emacs='emacs -nw'
alias vi='vim'

alias llah='ls -laFh'
alias lla='ls -laF'
alias llh='ls -lhF'
alias ll='ls -lF'
alias l='ls -CF'
