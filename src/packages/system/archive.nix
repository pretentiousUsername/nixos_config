{ config, pkgs }:

{
  users.users.pines.packages = with pkgs; [
    atool
    gzip
    zip
    unzip
  ];
}
