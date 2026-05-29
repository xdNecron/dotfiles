#!/usr/bin/env bash
<<<<<<< HEAD
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar 2>&1 | tee -a /tmp/polybar1.log & disown

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example 2>1 | tee -a /tmp/polybar1.log &
done
=======
killall polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar 2>&1 | tee -a /tmp/polybar1.log & disown
>>>>>>> 51d35873132e5313c84e2fdc2986306cd2e85e04
