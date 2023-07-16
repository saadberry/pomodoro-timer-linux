#!/bin/bash

# Time elapsed since start
time_elapsed=0

# Pomodoro time 
pomo=10000 

# Starting message
starting_msg="Good luck on your journey, O chosen one!"

# Displaying Starting message
echo $starting_msg

# echo -n "Time remaining till next break: "

while [[ $time_elapsed -le $pomo ]] ; do
    if (( time_elapsed % 1000 == 0 )); then
        clear  # Clear the terminal screen before each update
    fi
    time_remaining=$(( (pomo - time_elapsed) / 1000 ))

    printf "\rTime remaining till next break: %s" "$time_remaining"
    ((time_elapsed+=100))
    sleep 0.1
done 

# echo $time_elapsed

if [ $time_elapsed -gt $pomo ]; then
    # echo -e "\nPomodoro complete! Wohoo!"
    notify-send "Wohoo!" "Your Pomodoro has been completed"
fi