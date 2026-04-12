#!/usr/bin/env sh

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_THEME=Oxygen_White
export XCURSOR_SIZE=34
export QT_SCALE_FACTOR=1.5
export GDK_SCALE=1.5
export GDK_DPI_SCALE=1.25

run() {
  pgrep -x "$1" > /dev/null || "$@" &
}

xsetroot -cursor_name left_ptr

xrandr --output eDP-1 --mode 2560x1600
xrandr --output DP-2 --mode 1920x1080 --rate 239.6888
xrandr --output HDMI-1 --off

run sxhkd
run picom
run lxpolkit
run skippy-xd --start-daemon
run nitrogen --restore
run clipton watcher
run polybar
run dunst

ssh -Nf pide-podman
