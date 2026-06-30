{ config, lib, ... }:

{
  imports = [
    ./misc.nix
    ./fonts.nix
    ./xserver.nix
    ./i3.nix
    ./kde.nix
    ./wal.nix
  ];
  
  desktop = {
    misc.enable = lib.mkDefault true;
    default-fonts.enable = lib.mkDefault true;
    i3.enable = lib.mkDefault false;
    xserver.enable = lib.mkIf i3.enable true;
    wal.enable = lib.mkIf i3.enable true;
    kde.enable = lib.mkDefault false;
  };
}
