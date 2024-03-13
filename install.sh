#!/usr/bin/env bash

# Specify the name of your command
command_name="slash"

# Specify the path to your script
script_path="./slash.sh"

# Determine the location to install the script based on the operating system
if [[ $(uname) == "Darwin" ]]; then
    # macOS
    install_dir="/usr/local/bin"
else
    # Linux
    install_dir="/usr/bin"
fi

# Copy the script to the install directory
cp "$script_path" "$install_dir/$command_name"

# Set permissions to make the script executable
chmod +x "$install_dir/$command_name"

echo "Installation complete. $command_name is now available as a shell command."

