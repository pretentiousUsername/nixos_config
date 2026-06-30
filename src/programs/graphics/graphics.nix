{ config, pkgs }:

{
  users.users.pines.packages = [
    decker
    imagemagick
    gimp
    inkscape
  ];
}
