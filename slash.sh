#!/bin/bash

pretty_shorten_text() {
    local text="$1"
    local columns="$2"

    # Calculate max length as 80% of terminal width
    local max_length=$((columns * 80 / 100))


    if [ ${#text} -gt $max_length ]; then
        echo "${text:0:$max_length}..."
    else
        echo "$text"
    fi
}


display_help() {
  echo "Usage: $0 [-c value]"
  echo "  -c   Run command after banner"
  echo "  -t   Specify the content to display"
  echo "  --help   Display this help message"
  exit 0
}

# Check for --help option
if [[ "$1" == "--help" ]]; then
  display_help
fi

while getopts ":c:t:" opt; do
  case $opt in
    c)
      arg_cmd="$OPTARG"
      ;;
    t)
      arg_t="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [[ $arg_t ]]; then
  bannertext=$arg_t
elif [[ $arg_cmd ]]; then
  bannertext=$arg_cmd
fi



if [[ $bannertext ]]; then
  columns=$(tput cols) # Screen width
  bannertext=$(pretty_shorten_text "$bannertext" "$columns")

  partLength=$((($columns - ${#bannertext}) / 2 - 1))

  part1=$(printf '=%.0s' $(seq 1 $partLength))
  part2=$(printf '=%.0s' $(seq 1 $partLength))

  echo "$part1 $bannertext $part2"
  if [[ arg_cmd ]]; then
    exec $bannertext
  fi
else # if no argument is given just print =====
  echo $(printf '=%.0s' $(seq 1 $(tput cols)))
fi
