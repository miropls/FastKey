#!/bin/bash

clear;

gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Fastkey is a neat little SSH key generation tool which uses ssh-keygen and ssh-add under the hood." "" "Please select which type of key you'd like to generate."

# Get preferred key type
KEY=$(gum choose "ed25519" "ed25519-sk" "dsa" "ecdsa" "ecdsa-sk" "rsa")

clear; gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Would you like to give your key a custom name? (default: 'id_$KEY')"
WANTNAME=$(gum choose "No" "Yes")

if [[ $WANTNAME = "Yes" ]]; then
    KEYNAME=$(gum input --placeholder "Please input the desired name for the key...")
fi

clear; gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "You selected a $KEY key. Would you like to add a password?"

WANTPASS=$(gum choose "No" "Yes")

if [[ $WANTPASS = "Yes" ]]; then
    PASS=$(gum input --password --placeholder "Please input the desired password for the key...")
fi

clear; 

if [[ ! -z "$KEYNAME" ]]; then
    gum spin -s points --title "Generating $KEY key..." sleep 1
    ssh-keygen -q -t $KEY -N "$PASS" -f ~/.ssh/$KEYNAME >/dev/null 2>&1
    ssh-add ~/.ssh/"$KEYNAME"
    gum style --border normal --margin "1" --padding "1 2" --border-foreground 150 "A new SSH key $KEYNAME has been generated in ~/.ssh folder and added to your ssh-agent. Thank you for using FastKey! :)"
else
    gum spin -s points --title "Generating $KEY key..." sleep 1
    ssh-keygen -q -t $KEY -N "$PASS" -f ~/.ssh/"id_$KEY" >/dev/null 2>&1
    ssh-add ~/.ssh/"id_$KEY"
    gum style --border normal --margin "1" --padding "1 2" --border-foreground 150 "A new SSH key 'id_$KEY' has been generated in ~/.ssh folder and added to your ssh-agent. Thank you for using FastKey! :)"
fi

exit
