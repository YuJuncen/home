#! /bin/bash

set -e

die() {
    stack_len=${#FUNCNAME[@]}
    echo -e "[FATAL:${BASH_SOURCE[$((stack_len-1))]}:${FUNCNAME[$((stack_len-1))]}]:${LINENO[$((stack_len-1))]}" "$@"
    exit 
}

while [ $# -ne 0 ]; do
    case $0 in
    --skip-install-packages) skip_install_packages=1;;
    --skip-install-spacemacs) skip_install_spacemace=1;;
    --debug) set -x;;
    *) die "unknown argument $0";;
    esac
    shift
done

if [ ! $skip_install_packages ]; then
    sudo wget -O /usr/local/bin/pacapt \
        https://github.com/icy/pacapt/raw/ng/pacapt
    sudo chmod 755 /usr/local/bin/pacapt
    sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true

    pacman -Syu fish jq emacs tmux
fi

if [ ! $skip_install_spacemace ]; then
    if ! which -s emacs; then
        echo "WARN: emacs not installed"
    fi
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

cp ./.vimrc ~
cp ./.tmux.conf ~
cp -r .vim ~/