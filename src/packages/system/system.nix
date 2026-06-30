{ config, pkgs }:
{
  users.users.pines.packages = [
    alacritty-graphics
    hyfetch  # yep
    btop
    thunar
    ranger
    lxappearance
    gparted
  ];
}
