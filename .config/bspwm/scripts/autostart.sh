#!/usr/bin/env sh

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_THEME='Bibata-Modern-Ice'
export XCURSOR_SIZE=32
export GDK_DPI_SCALE=1.4
#export GDK_SCALE=2.0
run() {
  pgrep -x "$1" > /dev/null || "$@" &
}

xsetroot -cursor_name left_ptr
xrandr --output eDP-1 --scale 1x1 --mode 2560x1600 --rate 60.00
run sxhkd
run picom
run nitrogen --restore
run polybar
run dunst
run lxpolkit
run brightnessctl set 60%
