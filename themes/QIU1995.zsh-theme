#!/bin/zsh

function _nb () {
  echo "%{$fg_no_bold[$1]%}$2%{$reset_color%}"
}
function _b () {
  echo "%{$fg_bold[$1]%}$2%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="⚡"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED="1"

ZSH_THEME_GIT_PROMPT_STASHED="%{${fg_bold[blue]}%}S%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{${fg_bold[magenta]}%}C%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{${fg_bold[red]}%}D%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{${fg_bold[cyan]}%}R%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{${fg_bold[yellow]}%}M%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{${fg_bold[green]}%}A%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{${fg_bold[red]}%}N%{${reset_color}%}"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{${fg_bold[cyan]}%}⇑ "
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{${reset_color}%}"

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR="%{${fg_bold[yellow]}%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" ᐱ "
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR="%{${fg_bold[white]}%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" ᐯ "


PROMPT='\
╭─$(_b cyan "%n")@$(_nb cyan "%M") $(_nb cyan "%~")\
%{${fg_no_bold[yellow]}%}$(__git_ps1)%{${reset_color}%} $(git_remote_status) $(parse_git_dirty) $(git_prompt_status)
╰─$(_b yellow "[")%?$(_b yellow "]")$CONDA_PROMPT_MODIFIER$(_b cyan ">") \
'

RPROMPT='%{$fg_no_bold[green]%}20%D %*%{$reset_color%}'

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
