#!/bin/sh
LID_STATE=$(cat /proc/acpi/button/lid/LID/state | grep -Eo "open|closed")

export DISPLAY=:0

echo "$(xrandr 2>1)" > /home/adamdgaf/liddbg

if [ "$LID_STATE" = "closed" ]; then
	xrandr --output 'eDP-1' --off 2>/home/adamdgaf/liddbg
else
	echo "OPEN" > /home/adamdgaf/lid
	xrandr --output 'eDP-1' --right-of 'HDMI-2' --auto --noprimary 2>/home/adamdgaf/liddbg
fi
