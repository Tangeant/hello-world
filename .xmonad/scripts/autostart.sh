#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.xmonad/scripts/set-screen-resolution.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

#change your keyboard if you need it
#setxkbmap -layout be

#cursor active at boot
xsetroot -cursor_name left_ptr &

#Some ways to set your wallpaper besides variety or nitrogen
run variety &
feh --bg-scale ~/.xmonad/wall.jpg &
#start the conky to learn the shortcuts once xfdesktop has started
#conky -c $HOME/.xmonad/scripts/system-overview &
#start polybar
run $HOME/.config/polybar/launch.sh &

#starting utility applications at boot time
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
compton -b --blur-method kawase --blur-strength 6 --config $HOME/.xmonad/scripts/compton.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run calcurse -d &

#starting user applications at boot time
#run discord &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
run thunar --daemon&
#run dropbox &
#run insync start &
#run spotify &
#run atom &
#run volumeicon &