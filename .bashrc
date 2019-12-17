#
# startup file for bash shells
#

export PAGER=less
[ -d /opt/topspin3.5pl6 ] && export PATH=${PATH}:/opt/topspin3.5pl6
[ -d /usr/local/texlive/2018/bin/x86_64-linux ] && export PATH=/usr/local/texlive/2018/bin/x86_64-linux:${PATH}
export PATH=${HOME}/bin:${HOME}/local/bin:${PATH}:/opt/SpinDrops/
export XWINNMRHOME=/opt/PV5.1
export XWINNMRHOME=${HOME}/src/pv51
export VAGRANT_HOME=/scrap/tesch/.vagrant.d
export ANDROID_HOME=${HOME}/Android/Sdk

#if command -v emacs >/dev/null 2>&1 ; then
    #export EDITOR="emacs -nw"
    #export GIT_EDITOR="emacs -nw"
#fi

# MacOS CUDA compilers
if [ -d "/Developer/NVIDIA/CUDA-7.0" ]; then
    export PATH=${PATH}:/Developer/NVIDIA/CUDA-7.0/bin
    export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:${DYLD_LIBRARY_PATH}
fi
top50() {
    readelf -sW "$1" | awk '$4 == "OBJECT" { print }' | sort -k 3 -n -r | head -n 50 | c++filt
    readelf -sW "$1" | wc -l
}
#export vnmruser=$HOME/CMRRpack2
#export vnmrsystem=$HOME/Documents/umn/vnmrj_3.2

if [ -z "$PS1" ]; then
    # non-interactive
    return
fi

alias ls="ls -F"
alias more=less
alias mkpwd='openssl rand -base64 6'
alias oopen=xdg-open
alias emore="grep --color=always -E '^|error|undefined|candidate' | less -R" # for make 2>&1 | emore

PS1='\h:\W \u$ '
shopt -s checkwinsize

# use newer compilers on CentOS 6
function optrh() {
    
    for package in devtoolset-8 llvm-toolset-7.0 rh-python36 rh-git29 ; do
        if [ ! -f /opt/rh/${package}/enable ]; then echo "skipping $package"; continue ; fi
        echo "Enabling $package"
        source "/opt/rh/${package}/enable"
    done
}

optrh

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/scrap/tesch/local/google-cloud-sdk/path.bash.inc' ]; then
    source '/scrap/tesch/local/google-cloud-sdk/path.bash.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/scrap/tesch/local/google-cloud-sdk/completion.bash.inc' ]; then
    source '/scrap/tesch/local/google-cloud-sdk/completion.bash.inc';
fi

export RVA_CRED="$HOME/Documents/rva/rva_credentials.conf"

# added by travis gem
[ -f /Users/tesch/.travis/travis.sh ] && source /Users/tesch/.travis/travis.sh

# google cloud sdk
[ -f /Users/tesch/share/google-cloud-sdk/path.bash.inc ] && source /Users/tesch/share/google-cloud-sdk/path.bash.inc
