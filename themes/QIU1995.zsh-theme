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
  __GIT_PREFIX="$(parse_git_dirty)$fg_bold[yellow]:[$fg_bold[cyan]"
  __GIT_SUFFIX="$fg_bold[yellow]]$(git_prompt_status)"
  __GIT__=$(__git_ps1 "${__GIT_PREFIX}%s${__GIT_SUFFIX}")
  PROMPT="%{$fg_bold[cyan]%}[%{$fg_no_bold[green]%}%M"
  PROMPT+="%{$fg_bold[cyan]%}:%{$reset_color%}%n"
  PROMPT+="%{$fg_bold[cyan]%}: %{$fg_no_bold[cyan]%}%~"
  PROMPT+="%{$fg_bold[cyan]%}] "
  PROMPT+="${__GIT__}"$'\n'
  PROMPT+="%{$fg_bold[yellow]%}["
  PROMPT+="%(?:%{$reset_color%}:%{$fg_no_bold[magenta]%})%?"
  PROMPT+="%{$fg_bold[yellow]%}]"
  PROMPT+="%{$fg_bold[cyan]%}> %{$reset_color%}"
}

RPROMPT="%{$fg_no_bold[green]%}20%D %*%{$reset_color%}"

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
