
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

ibus-daemon -drx &

sleep 2
ibus engine xkb:fr:latin9:fra &
