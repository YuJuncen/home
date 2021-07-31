#! /bin/bash

set -e

die() {
    stack_len=${#FUNCNAME[@]}
    linenum=$(caller | awk '{print $1}' | head -n1)
    echo -e "[Fatal in ${BASH_SOURCE[$((stack_len-1))]} (${FUNCNAME[$((stack_len-1))]}:$linenum)]" "$@"
    exit 1
}

install_yum() {
    sudo yum update
    yes | sudo yum install "$@"
}

install_any() {
    sudo wget -O /usr/local/bin/pacapt \
        https://github.com/icy/pacapt/raw/ng/pacapt
    sudo chmod 755 /usr/local/bin/pacapt
    sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true

    pacman -Suy; pacman -S fish jq emacs tmux
}

probe() {
    which "$@" >/dev/null
}

# prepare downloads all items needed from network. 
prepare() {
    # install vim plugin
    if probe fish; then
        echo "set-option -g default-shell $(which fish)" >> .tmux.conf
    fi
    curl -fLo ./.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# copy copies the artifacts into the home dir.
# this function won't connect to the network.
copy() {
    home=${1:-$HOME}
    cp ./.vimrc "$home"
    cp ./.tmux.conf "$home"
    cp -r .vim "$home"
    echo 'please exec `InstallPlug` in vim for installing vim plugins'
}

# install installs the common packages via package manager.
install() {
    if probe yum; then
        install_yum tmux vim fish jq
        return
    fi
    install_any vim fish jq vim
}

trap 'echo "fail..." && caller' ERR

while [ $# -ne 0 ]; do
    case $1 in
    --install-pkg) install_packages=1;;
    --debug) set -x;;
    --verbose | -v) set -v;;
    --prepare ) only_prepare=1 ;;
    *) die "unknown argument $1";;
    esac
    shift
done

prepare
if [ $only_prepare ]; then
    exit 0
fi

if [ $install_packages ]; then
    install
fi

copy "$HOME"