#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root"
    exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [[ $DIR != "/usr/local/cfg" ]]; then
    echo "Repository in wrong directory [${DIR}] please use /usr/local/cfg"
    exit
fi

USR=""
pkg=n
dist="arch"

help() {
    echo "$0 -u user [...]"
    exit -1
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -u|--user)
            USR="$2"
            shift
            shift
            ;;
        -p|--package)
            pkg=y
            shift
            ;;
        -d|--dist)
            dist="$2"
            shift
            shift
            ;;
        -h|--help)
            help
            ;;
        *)
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done

if [[ -z $USR ]]; then
    echo "Please specify user"
    help
fi

echo "Running setup for: ${USR}"

#### DOWNLOAD PACKAGES #########################################################

if [[ pkg = y ]]; then

    echo "Installing packages..."

    pacman -S \
        vi \
        vim \
        git \
        openssh \
        sway alacritty waybar wofi \
        xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland

    echo "Installing yay..."
    $(
        cd /opt
        git clone https://aur.archlinux.org/yay-git.git
        chown -R $USR:$USR ./yay-git
        cd yay-git
        su $USR
        cd /opy/yay-git
        makepkg -si
        yay -S \
            google-chrome \
            visual-studio-code-bin
    )
fi

#### CREATE DIRECTORIES ########################################################

mkdir -p /home/${USR}/.bak
chmod -R ${USR}:${USR} /home/${USR}/.bak

#### FUNCTIONS #################################################################

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
    dst_dir=$(dirname $dst)
    mkdir -p ${dst_dir}
    chown ${USR}:${USR} ${dst_dir}
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

#### LINK FILES ################################################################

link_file vimrc /home/${USR}/.vimrc
link_file gdbinit /home/${USR}/.gdbinit
link_file tmux.conf /home/${USR}/.tmux.conf
link_file xinitrc /home/${USR}/.xinitrc
link_file i3/config /home/${USR}/.config/i3/config
link_file i3/app-icons.json /home/${USR}/.config/i3/app-icons.json
link_file i3status/config /home/${USR}/.config/i3status/config
link_file sway/config /home/${USR}/.config/sway/config
link_file waybar/config /home/${USR}/.config/waybar/config
link_file waybar/style.css /home/${USR}/.config/waybar/syle.css
link_file picom.conf /home/${USR}/.config/picom.conf
link_file clang-format /home/${USR}/.clang-format
link_file kitty/kitty.conf /home/${USR}/.config/kitty/kitty.conf
link_file vim/colors/pear.vim /home/${USR}/.vim/colors/pear.vim
link_file vim/autoload/plug.vim /home/${USR}/.vim/autoload/plug.vim
link_file vim/indent/html.vim /home/${USR}/.vim/indent/html.vim
link_file vim/lsp_settings/settings.json /home/${USR}/.local/share/vim-lsp-settings/settings.json
link_file keyboard_layouts/pear /usr/share/X11/xkb/symbols/pear
link_file vscode/settings.json /home/${USR}/.config/Code/User/settings.json
link_file vscode/keybindings.json /home/${USR}/.config/Code/User/keybindings.json

#### UPDATE CONTENT ############################################################

update_content /home/${USR}/.bashrc "#" "
source ${DIR}/bash_aliases
source ${DIR}/bash_env
"
update_content /home/${USR}/.gitconfig "#" "
[include]
  path = ${DIR}/gitconfig
"

#### SETUP #####################################################################

# Set keyboard layout
# Changes: cat /etc/X11/xorg.conf.d/00-keyboard.conf
echo "-----------------"
echo "Please add they keymap (pear) to /usr/share/X11/kb/rules/base.lst/.xml"
echo "Also:"
echo "<layout>"
echo " <configItem>"
echo "   <name>pear</name>"
echo "   <!-- Keyboard indicator for Pear layouts -->"
echo "   <shortDescription>pear</shortDescription>"
echo "   <description>Pear</description>"
echo " </configItem>"
echo "</layout>"

# localectl --no-convert\
#          set-x11-keymap\
#          pear\
#          pc105+inet\
#          terminate:ctrl_alt_bksp,caps:swapescape,lv3:alt_switch

