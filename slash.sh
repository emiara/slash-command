#!/usr/bin/env bash

display_help() {
  echo "Usage: $0 [-c value]"
  echo "  -c   Specify the content to display"
  echo "  --help   Display this help message"
  exit 0
}

# Check for --help option
if [[ "$1" == "--help" ]]; then
  display_help
fi
while getopts ":c:" opt; do
  case $opt in
    c)
      arg_c="$OPTARG"
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

if [[ $arg_c ]]; then
  columns=$(tput cols) # Screen width
  partLength=$((($columns - ${#arg_c}) / 2 - 1))

  part1=$(printf '=%.0s' $(seq 1 $partLength))
  part2=$(printf '=%.0s' $(seq 1 $partLength))

  echo "$part1 $arg_c $part2"
  exec $arg_c
else # if no argument is given just print =====
  echo $(printf '=%.0s' $(seq 1 $(tput cols)))
fi

