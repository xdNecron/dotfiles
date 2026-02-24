#!/bin/env sh

lid_state=$(cat /proc/acpi/button/lid/LID/state | grep -Eo "open|closed")
echo $lid_state
