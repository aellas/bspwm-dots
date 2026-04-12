#!/usr/bin/env sh

options=" Shutdown\n Reboot\n󰒲 Suspend\n Lock\n󰿅 Logout"

chosen=$(echo -e "$options" | rofi -dmenu -theme-str 'window { width: 16%; }' -no-fixed-num-lines -i -p "Power Menu")

case "$chosen" in
" Shutdown")
    loginctl poweroff 0
    ;;
" Reboot")
    loginctl reboot
    ;;
"󰒲 Suspend")
    loginctl suspend
    ;;
" Lock")
    betterlockscreen -l
    ;;
"󰿅 Logout")
    bspc quit && killall bspwm && exit 0
    ;;
esac
