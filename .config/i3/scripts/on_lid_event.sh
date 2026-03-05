#!/bin/bash

dbg=/home/adamdgaf/lid

uname=$(who | grep -Po "^.+(?= :0)")

export DISPLAY=:0
export XAUTHORITY="/home/$uname/.Xauthority"

second_display=$(xrandr 2>>$dbg | grep -Po "(?>[^eDP\-1]).*(?= connected)" | head -n 1)

if grep -q open /proc/acpi/button/lid/LID/state; then echo "OPEN" >> $dbg
    xrandr --output $second_display --primary --auto
	xrandr --output 'eDP-1' --right-of $second_display --auto
else
	xrandr --output 'eDP-1' --off 
fi
