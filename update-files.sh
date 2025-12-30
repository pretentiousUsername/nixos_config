#!/bin/bash

# Add pulling and stuff later.

set -e

# pushd ~/Projects/nixos_config/

if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

diffs=$(git diff --name-only src/)
echo $diffs

for f in $diffs; do echo "${f}"; done

# popd

# git add .
# git commit
# git push
# 
# sudo cp -a src/. /etc/nixos/
