
export BROWSER="/usr/bin/google-chrome-stable"

setxkbmap pear && 
setxkbmap -option caps:swapescape &&
setxkbmap -option lv3:alt-switch
feh --bg-scale /usr/local/conf/bg/windows_xp.jpg &&
exec i3

