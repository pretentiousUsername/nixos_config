#!/usr/bin/env bash

# This is partially based on the No Boilerplate script.

rebuild() {
    set -e
    pushd ~/Projects/dotfiles/nixos/
    
    git diff -U0 "*.nix"
    git add .
    echo "Rebuilding NixOs."
    sudo nixos-rebuild switch -I nixos-config=src/configuration.nix \
        &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)
    
    current=$(nixos-rebuild list-generations | grep current)
    
    git commit -am "$current"
    
    # diffs=$(git diff --name-only src/)
    # echo $diffs
    
    # for f in $diffs; do echo "${f}"; done
    
    popd
    
    notify-send -e "NixOS rebuilt." --icon=software-update-available
}


upgrade() {
    set -e
    pushd ~/Projects/dotfiles/nixos/
    
    git diff -U0 "*.nix"
    git add .
    echo "Rebuilding NixOs."
    sudo nixos-rebuild switch --upgrade -I nixos-config=src/configuration.nix \
        &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)
    
    current=$(nixos-rebuild list-generations | grep current)
    
    git commit -am "$current"
    
    # diffs=$(git diff --name-only src/)
    # echo $diffs
    
    # for f in $diffs; do echo "${f}"; done
    
    popd
    
    notify-send -e "NixOS rebuilt." --icon=software-update-available
}

collect_garbage() {
    sudo nix-collect-garbage -d --delete-older-than 7d
}

no_args="true"

while getopts "ud" option; do
    case "$option" in 
        u) # upgrade packages
            upgrade
            # echo "no";
            exit 0
            ;;
        d) # collect garbage
            collect_garbage
            # echo "yes";
            exit 0
            ;;
        *) # rebuild system
            # rebuild
            echo "maybe";
            exit 0
            ;;
    esac
    no_args="false"
done

[[ "$no_args" == "true" ]] && { rebuild; exit 0; }
