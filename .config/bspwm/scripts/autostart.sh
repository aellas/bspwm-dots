#!/usr/bin/env sh

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_THEME='Bibata-Modern-Ice'
export XCURSOR_SIZE=32
export QT_SCALE_FACTOR=1.5
export GDK_DPI_SCALE=0.8
export GDK_SCALE=2.0
run() {
  pgrep -x "$1" > /dev/null || "$@" &
}

xsetroot -cursor_name left_ptr
xrandr --output eDP-1 --scale 1x1 --mode 2560x1600 --rate 60.00
#xrandr --output HDMI-1 --mode 1920x1080 --rate 239.76
run sxhkd
run picom
run skippy-xd --start-daemon
run nitrogen --restore
run clipton watcher
run polybar
run dunst
run lxpolkit
run xmodmap -e "keycode 112 = NoSymbol"
run brightnessctl set 60%
run  ghostty --gtk-single-instance=true --quit-after-last-window-closed=false --initial-window=false
eval $(/usr/bin/gnome-keyring-daemon --start --daemonize --components=secrets,pkcs11)
export SSH_AUTH_SOCK
