#
# startup file for bash shells
#

export PAGER=less
export PATH=${PATH}:${HOME}/bin

#export vnmruser=$HOME/CMRRpack2
#export vnmrsystem=$HOME/Documents/umn/vnmrj_3.2

if [ -z "$PS1" ]; then
    # non-interactive
    return
fi

alias ls="ls -F"
alias more=less

PS1='\h:\W \u$ '
shopt -s checkwinsize
