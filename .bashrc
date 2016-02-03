#
# startup file for bash shells
#

export PAGER=less
export PATH=${PATH}:${HOME}/bin:${HOME}/local/bin

export PATH=${PATH}:/Developer/NVIDIA/CUDA-7.0/bin
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:${DYLD_LIBRARY_PATH}

#export vnmruser=$HOME/CMRRpack2
#export vnmrsystem=$HOME/Documents/umn/vnmrj_3.2

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


alias mkpwd='openssl rand -base64 6'

