# FastKey

FastKey is a small shell script to easily generate a SSH key and add it to your ssh-agent. It uses charmbracelet/gum to make the script pretty.
It is designed to be used on UNIX/POSIX systems such as Ubuntu and MacOS.

## Quick overview

FastKey is a very simple script which prompts the user to generate a SSH key of preferred type. Optionally you can give the key a password, as well as give it a custom name if you prefer.
The key is generated in you ~/.ssh folder and automatically added into your ssh-agent.

## How to use FastKey

1. Follow the instructions at [charmbracelet/gum](https://github.com/charmbracelet/gum#installation) to install Gum on your system.
2. Clone this repo, or simply copy the contents of the fastkey.sh script to a file on your system.
3. Make sure the script is executable with `chmod +x fastkey.sh`
4. Run the script with `./fastkey.sh`
5. If you decide to use a password with your key you will be prompted to enter the password to the ssh-add command.
6. Enjoy using your newly generated SSH key :)
