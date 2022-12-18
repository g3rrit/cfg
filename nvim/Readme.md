# Neovim Configuration

## Setting up true color mode

- Add compatible colorscheme to kitty config (`kitty.conf`): `include/path/color.conf`
- Enable true color mode in kitty config (`kitty.conf`): `term xterm-256`
- Enable true color mode in neovim (`init.vim`): `set termguicolors`
- Enable true color mode in tmux (`.tmux.conf`):
```
# Enable true color mode
set -g default-terminal "screen-256color"
# tell Tmux that outside terminal supports true color
set -ag terminal-overrides ",xterm-*:Tc"

# for tmux 3.2, you can use the following setting instead:
# set -as terminal-features ",xterm-256color:RGB"
```

### For Mac

Most likely not necessary

```
$ brew install ncurses
$ /opt/homebrew/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
$ tic -xe tmux-256color tmux-256color.info
# This creates a complied entry in ~/.terminfo
$ infocmp tmux-256color | head
#       Reconstructed via infocmp from file: /Users/libin/.terminfo/74/tmux-256color tmux-256color|tmux with 256 colors,
```

### Verifying

Open up a Tmux session, inside Tmux, the output of echo `$TERM` should be
`screen-256color` or `tmux-256color` depending on which term file you choose to use,
but the output definitely should not be `xterm-256color`

Run the following command:
```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```

### Notes

Run `verb set fo` to figure out where `fo` was last set

## Important Keybindings

- `ctrl+u`: scroll up
- `ctrl+d`: scroll down
- `ctrl+o`: previous jumplist
- `ctrl+i`: next jumplist

