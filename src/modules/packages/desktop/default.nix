{ config, lib, ... }:

{
  imports = [
    ./misc.nix
    ./fonts.nix
    ./i3.nix
    ./kde.nix
  ];
  
  desktop = {
    xserver.enable = lib.mkDefault false;
    wal.enable = lib.mkDefault false;
    misc.enable = lib.mkDefault true;
    default-fonts.enable = lib.mkDefault true;
    i3.enable = lib.mkDefault false;
    plasma.enable = lib.mkDefault false;
  };
}
