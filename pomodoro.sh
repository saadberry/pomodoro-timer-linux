#!/bin/bash

# Function to convert minutes to milliseconds
minutes_to_milliseconds() {
  # Check if an argument is provided
  if [ $# -ne 1 ]; then
    echo "Usage: minutes_to_milliseconds <minutes>"
    return 1
  fi

  # Extract the minutes from the argument
  minutes=$1

#   echo $minutes

  # Calculate milliseconds
  milliseconds=$((minutes * 60 * 1000))

  echo $milliseconds

  # Return the milliseconds value
#   return $milliseconds
}

# Capture the return value
result=$(minutes_to_milliseconds 1)

# echo $result

# Time elapsed since start
time_elapsed=0

# Assign Pomodoro time to returned value from function 
# Convert the variable to an integer using declare
declare -i pomo="$result"

# Starting message
starting_msg="Starting Pomodoro Session...\nPomodoro Session duration: ","$((pomo/60000))"" minutes","\nGood luck on your journey, O chosen one!"

# Displaying Starting message
echo -e $starting_msg
sleep 5

# echo -n "Time remaining till next break: "

while [[ $time_elapsed -le $pomo ]] ; do
    if (( time_elapsed % 1000 == 0 )); then
        clear  # Clear the terminal screen before each update
    fi
    time_remaining=$(( (pomo - time_elapsed) / 60000 ))

    printf "\rTime remaining till next break: %s" "$time_remaining"" mins"
    ((time_elapsed+=100))
    sleep 0.1
done 

# echo $time_elapsed

if [ $time_elapsed -gt $pomo ]; then
    # echo -e "\nPomodoro complete! Wohoo!"
    notify-send "Wohoo!" "Your Pomodoro has been completed"
fi

# # Check the type of the variable
# if [[ "$pomo" =~ ^[0-9]+$ ]]; then
#   echo "The variable is an integer."
# else
#   echo "The variable is not an integer."
# fi