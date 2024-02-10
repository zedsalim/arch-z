
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=20" -a "[fan:1]/GPUTargetFanSpeed=20" &

picom --config ~/.config/picom.conf &
dunst &

killall nm-applet
nm-applet &

numlockx on &

killall xfce4-power-manager
xfce4-power-manager &

killall sxhkd
sxhkd -c ~/.config/sxhkd/sxhkdrc &

pkill -f "kitty --title dropdown -e tmux new-session \; split-window -v"
kitty --title dropdown -e tmux new-session \; split-window -v &

pkill -f "kitty --title timer"
kitty --title timer &

pkill -f "kitty --title calculator"
kitty --title calculator --hold python -q &

ibus-daemon -drx &

sleep 2
ibus engine xkb:fr:latin9:fra &

setxkbmap -option "caps:escape" &

xset r rate 300 50
