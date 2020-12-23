#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [[ $DIR != "/usr/local/dotfiles" ]]; then
  echo "Repository in wrong directory [${DIR}] please use /usr/local/dotfiles"
  exit
fi

USR=${1:?No User specified}
echo "Running setup for: ${USR}"

mkdir -p /home/${USR}/.bak

function link_file {

  src=${1:?No source file specified}
  dst=${2:?No destination file specified}

  if [[ -e ${dst} ]]; then
    echo "Moving ${dst} to /home/${USR}/.bak/${src}"
    mv ${dst} /home/${USR}/.bak/${src}
  fi

  echo "Linking ${DIR}/${src} to ${dst}"
  ln -s ${DIR}/${src} ${dst}
}

link_file vimrc /home/${USR}/.vimrc
link_file gdbinit /home/${USR}/.gdbinit
link_file tmux.conf /home/${USR}/.tmux.conf
link_file xinitrc /home/${USR}/.xinitrc

echo "source ${DIR}/bash_aliaes" >> "/home/${USR}/.bashrc"
echo "source ${DIR}/bash_env" >> "/home/${USR}/.bashrc"

echo "[include]" >> "/home/${USR}/.gitconfig"
echo "  path = ${DIR}/gitconfig" >> "/home/${USR}/.gitconfig"

