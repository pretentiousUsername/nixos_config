#!/usr/bin/env bash

# This is partially based on the No Boilerplate script.

set -e
pushd ~/Projects/dotfiles//nixos_config/

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
