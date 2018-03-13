#
# startup file for bash shells
#

export PAGER=less
export PATH=${PATH}:${HOME}/bin:${HOME}/local/bin
export PATH=${PATH}:/opt/topspin3.5pl6
export XWINNMRHOME=/opt/PV5.1
export XWINNMRHOME=${HOME}/src/pv51
export VAGRANT_HOME=/scrap/tesch/.vagrant.d

# MacOS CUDA compilers
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

alias ls="ls -F"
alias more=less

PS1='\h:\W \u$ '
shopt -s checkwinsize


alias mkpwd='openssl rand -base64 6'

function optrh() {
    for enabler in /opt/rh/*/enable; do
        if [ -f "$enabler" ]; then
            source "$enabler"
        fi
    done
}


# added by travis gem
[ -f /home/tesch/.travis/travis.sh ] && source /home/tesch/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/scrap/tesch/local/google-cloud-sdk/path.bash.inc' ]; then source '/scrap/tesch/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/scrap/tesch/local/google-cloud-sdk/completion.bash.inc' ]; then source '/scrap/tesch/local/google-cloud-sdk/completion.bash.inc'; fi
