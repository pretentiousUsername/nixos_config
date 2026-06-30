{ config, pkgs }:

{
  users.users.pines.packages = [
    kicad
    freecad
    elmerfem
  ]
}
