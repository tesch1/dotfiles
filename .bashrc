#
# startup file for bash shells
#

export PAGER=less
export XWINNMRHOME=/opt/PV5.1
export XWINNMRHOME=${HOME}/src/pv51
export PYTHONSTARTUP=${HOME}/.pythonrc
export NPM_PACKAGES=${HOME}/.npm-packages
export PATH=${PATH}:${HOME}/bin:${HOME}/local/bin:$NPM_PACKAGES/bin
export PATH=${PATH}:/opt/SpinDrops

export RVA_CRED=$HOME/Documents/rva/rva_credentials.conf

#if command -v emacs >/dev/null 2>&1 ; then
#    export EDITOR="emacs -nw"
#    export GIT_EDITOR="emacs -nw"
#fi

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
alias more="less -R"
alias emore='egrep --color=always "(^|error)" | less -R'
alias mkpwd='openssl rand -base64 6'
top50() { readelf -sW $1 | awk '$4 == "OBJECT" { print }' | sort -k 3 -n -r | head -n 50 | c++filt; }

PS1='\h:\W \u$ '
shopt -s checkwinsize

# added by travis gem
[ -f /Users/tesch/.travis/travis.sh ] && source /Users/tesch/.travis/travis.sh

# google cloud sdk
[ -f /Users/tesch/share/google-cloud-sdk/path.bash.inc ] && source /Users/tesch/share/google-cloud-sdk/path.bash.inc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tesch/local/google-cloud-sdk/path.bash.inc' ]; then source '/home/tesch/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tesch/local/google-cloud-sdk/completion.bash.inc' ]; then source '/home/tesch/local/google-cloud-sdk/completion.bash.inc'; fi
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export QSYS_ROOTDIR="/home/tesch/intelFPGA_lite/18.0/quartus/sopc_builder/bin"
