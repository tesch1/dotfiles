#
# startup file for bash shells
#

export PAGER=less
export PATH=${PATH}:${HOME}/bin:${HOME}/local/bin
if command -v emacs >/dev/null 2>&1 ; then
    export EDITOR="emacs -nw"
    export GIT_EDITOR="emacs -nw"
fi
export XWINNMRHOME=/opt/PV5.1
export XWINNMRHOME=${HOME}/src/pv51

if [ -d "/Developer/NVIDIA/CUDA-7.0" ]; then
    export PATH=${PATH}:/Developer/NVIDIA/CUDA-7.0/bin
    export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:${DYLD_LIBRARY_PATH}
fi

#export vnmruser=$HOME/CMRRpack2
#export vnmrsystem=$HOME/Documents/umn/vnmrj_3.2

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

# use newer python
if [ -f "/opt/rh/python27/enable" ]; then
    source /opt/rh/python27/enable
fi

alias ls="ls -F"
alias more=less

PS1='\h:\W \u$ '
shopt -s checkwinsize


alias mkpwd='openssl rand -base64 6'

export RVA_CRED=$HOME/Documents/rva/rva_credentials.conf


# added by travis gem
[ -f /Users/tesch/.travis/travis.sh ] && source /Users/tesch/.travis/travis.sh

# google cloud sdk
[ -f /Users/tesch/share/google-cloud-sdk/path.bash.inc ] && source /Users/tesch/share/google-cloud-sdk/path.bash.inc
