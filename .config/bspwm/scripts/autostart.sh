#!/usr/bin/env sh

pipewire &
wireplumber &
pipewire-pulse &
xrandr --output DP-1 --mode 1920x1080 --rate 239.76 &
xrandr --output eDP-1 --mode 1920x1080 --rate 60.00 &
xrandr --output DP-2 --off &
xrandr --output HDMI-1 --off &
sxhkd &
xclip &
picom &
feh --bg-scale /home/array/bspwm-dots/wallpapers/black-cat-anime-moon-night-scenery-4k-wallpaper-uhdpaper.com-140@5@l.jpg &
xsetroot -cursor_name left_ptr &
lxpolkit &
brightnessctl s 24242 &
skippy-xd --start-daemon &
