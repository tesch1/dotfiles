#
# startup file for bash shells
#

export PAGER=less
export PATH=${PATH}:${HOME}/bin:${HOME}/local/bin
export XWINNMRHOME=/opt/PV5.1
export XWINNMRHOME=${HOME}/src/pv5

# use newer compilers on CentOS 6
if [ -d "/usr/lib64/openmpi/bin" ]; then
    export PATH=${PATH}:/usr/lib64/openmpi/bin
fi

if [ -z "$PS1" ]; then
    # non-interactive
    return
fi

# use newer compilers on CentOS 6
if [ -f "/opt/rh/devtoolset-3/enable" ]; then
    source /opt/rh/devtoolset-3/enable
fi

alias ls="ls -F"
alias more=less

PS1='\h:\W \u$ '
shopt -s checkwinsize

