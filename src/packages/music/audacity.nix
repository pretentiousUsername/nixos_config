{ config, pkgs }:

{
  users.users.pines.packages = with pkgs; [
    audacity
  ];
}
