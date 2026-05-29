<<<<<<< HEAD
#!/bin/sh
LID_STATE=$(cat /proc/acpi/button/lid/LID/state | grep -Eo "open|closed")

export DISPLAY=:0

echo "$(xrandr 2>1)" > /home/adamdgaf/liddbg

if [ "$LID_STATE" = "closed" ]; then
	xrandr --output 'eDP-1' --off 2>/home/adamdgaf/liddbg
else
	echo "OPEN" > /home/adamdgaf/lid
	xrandr --output 'eDP-1' --right-of 'HDMI-2' --auto --noprimary 2>/home/adamdgaf/liddbg
=======
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
>>>>>>> 51d35873132e5313c84e2fdc2986306cd2e85e04
fi
