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

# Create directories
mkdir -p /home/${USR}/.bak

mkdir -p /home/${USR}/.vim/colors
mkdir -p /home/${USR}/.vim/autoload

function link_file {

    src=${1:?No source file specified}
    dst=${2:?No destination file specified}

    if [[ -e ${dst} ]]; then
        echo "Moving ${dst} to /home/${USR}/.bak/${src}"
        mv ${dst} /home/${USR}/.bak/${src}
    elif [[ -L ${dst} ]]; then
        echo "File ${dst} points to invalid location... deleting"
        rm -f ${dst}
    fi

    echo "Linking ${DIR}/${src} to ${dst}"
    ln -s ${DIR}/${src} ${dst}
    chown ${USR}:${USR} ${dst}
}

function update_content {


    dst=${1:?No destination file specified}
    cchar=${2:?No comment character specified}
    content=${3:?No content specified}

    base_src=$(basename ${dst})

    START_MARKER="${cchar}START_CONFIG_REGION"
    END_MARKER="${cchar}END_CONFIG_REGION"

    if [[ -e ${dst} ]]; then
        echo "Moving ${dst} to /home/${USR}/.bak/${base_src}"
        cp ${dst} /home/${USR}/.bak/${base_src}
    else
        echo "File ${dst} does not exist... creating"
        touch ${dst}
    fi

    echo "Updating file ${dst}"

    TMP_AWK_FILE="/tmp/tmp_awk_conf_file"
 
    awk '
BEGIN {
    marker=!marker;
}
{
    if ($0=="'"${START_MARKER}"'") {
        marker=!marker;
    }
    if (marker) {
        print $0;
    }
    if ($0=="'"${END_MARKER}"'") {
        marker=!marker;
    }
}' ${dst} > ${TMP_AWK_FILE}

    if [[ $? -ne 0 ]]; then
        echo "AWK error. Skipping ${dst}"
        return
    fi

    mv ${TMP_AWK_FILE} ${dst}

    echo "${START_MARKER}" >> ${dst}
    echo "${content}" >> ${dst}
    echo "${END_MARKER}" >> ${dst}

    chown ${USR}:${USR} ${dst}
}

link_file vimrc /home/${USR}/.vimrc
link_file gdbinit /home/${USR}/.gdbinit
link_file tmux.conf /home/${USR}/.tmux.conf
link_file xinitrc /home/${USR}/.xinitrc
link_file i3/config /home/${USR}/.config/i3/config
link_file i3/app-icons.json /home/${USR}/.config/i3/app-icons.json
link_file i3status/config /home/${USR}/.config/i3status/config
link_file clang-format /home/${USR}/.clang-format
link_file kitty/kitty.conf /home/${USR}/.config/kitty/kitty.conf
link_file vim/colors/pear.vim /home/${USR}/.vim/colors/pear.vim
link_file vim/autoload/plug.vim /home/${USR}/.vim/autoload/plug.vim

update_content /home/${USR}/.bashrc "#" "
source ${DIR}/bash_aliases
source ${DIR}/bash_env
"
update_content /home/${USR}/.gitconfig "#" "
[include]
  path = ${DIR}/gitconfig
"

