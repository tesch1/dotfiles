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
export RVA_CRED="$HOME/Documents/rva/rva_credentials.conf"

[ -d /opt/topspin3.5pl6 ] && export PATH=${PATH}:/opt/topspin3.5pl6
[ -d /usr/local/texlive/2017/bin/x86_64-linux ] && export PATH=/usr/local/texlive/2017/bin/x86_64-linux:${PATH}
export VAGRANT_HOME=/scrap/tesch/.vagrant.d

# MacOS CUDA compilers
if [ -d "/Developer/NVIDIA/CUDA-7.0" ]; then
    export PATH=${PATH}:/Developer/NVIDIA/CUDA-7.0/bin
    export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:${DYLD_LIBRARY_PATH}
fi

#export vnmruser=$HOME/CMRRpack2
#export vnmrsystem=$HOME/Documents/umn/vnmrj_3.2

if [ -z "$PS1" ]; then
    # non-interactive
    return
fi

alias ls="ls -F"
alias more="less -R"
alias mkpwd='openssl rand -base64 6'
top50() { readelf -sW $1 | awk '$4 == "OBJECT" { print }' | sort -k 3 -n -r | head -n 50 | c++filt; }
alias oopen=xdg-open
alias emore="grep --color=always -E '^|error|undefined|candidate' | less -R" # for make 2>&1 | emore

PS1='\h:\W \u$ '
shopt -s checkwinsize

# use newer compilers on CentOS 6
function optrh() {
    for enabler in /opt/rh/*/enable; do
        if [ -f "$enabler" ]; then
            source "$enabler"
        fi
    done
}

# added by travis gem
[ -f "${HOME}/.travis/travis.sh" ] && source "${HOME}/.travis/travis.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/local/google-cloud-sdk/path.bash.inc" ]; then source "${HOME}/local/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/local/google-cloud-sdk/completion.bash.inc" ]; then source "${HOME}/local/google-cloud-sdk/completion.bash.inc"; fi

#export QSYS_ROOTDIR="/home/tesch/intelFPGA_lite/18.0/quartus/sopc_builder/bin"
