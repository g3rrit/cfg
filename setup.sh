#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root"
  exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [[ $DIR != "/usr/local/conf" ]]; then
  echo "Repository in wrong directory [${DIR}] please use /usr/local/conf"
  exit
fi

USR=${1:?No User specified}
echo "Running setup for: ${USR}"

UPDATE_STR="[conf]added"

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
link_file i3/config /home/${USR}/.config/i3/config
link_file i3status/config /home/${USR}/.config/i3status/config
link_file clang-format /home/${USR}/.clang-format

FILE_BASHRC="/home/${USR}/.bashrc"
FILE_GITCONFIG="/home/${USR}/.gitconfig"

if ! [[ grep -q "${UPDATE_STR}" ${FILE_BASHRC} ]]; then

	echo "Updating bashrc [${FILE_BASHRC}]"

	echo "source ${DIR}/bash_aliases" >> ${FILE_BASHRC}
	echo "source ${DIR}/bash_env" >> ${FILE_BASHRC}
	echo "#${UPDATE_STR}" >> ${FILE_BASHRC}
fi

if ! [[ grep -q "${UPDATE_STR}" ${FILE_GITCONFIG} ]]; then

	echo "Updating gitconfig [${FILE_GITCONFIG}"

	echo "[include]" >> ${FILE_GITCONFIG}
	echo "  path = ${DIR}/gitconfig" >> ${FILE_GITCONFIG}
	echo "#${UPDATE_STR}" >> ${FILE_GITCONFIG}
fi

