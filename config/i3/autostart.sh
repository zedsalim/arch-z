
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

picom --config ~/.config/picom.conf &
dunst &

killall nm-applet
nm-applet &

numlockx on &

killall xfce4-power-manager
xfce4-power-manager &

killall sxhkd
sxhkd -c ~/.config/sxhkd/sxhkdrc &

pkill -f "kitty --title DDropdown -e tmux new-session \; split-window -v"
kitty --title DDropdown -e tmux new-session \; split-window -v &

pkill -f "kitty --title ttimmerr -e nvim /tmp/tmp.md"
kitty --title ttimmerr -e nvim /tmp/tmp.md &

pkill -f "kitty --title py-Ccal"
kitty --title py-Ccal --hold python -q &

pkill -f "thunderbird"
thunderbird &

ibus-daemon -drx &

sleep 2
ibus engine xkb:fr:latin9:fra &

setxkbmap -option "caps:escape_shifted_capslock" &
# setxkbmap -option "caps:escape" &

xset r rate 300 50 &

pkill -f "/bin/bash ~/.config/scripts/ayats.sh"
/bin/bash ~/.config/scripts/ayats.sh
