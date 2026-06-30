{ config, lib, ... }:

{
  imports = [
    ./misc.nix
    ./fonts.nix
    ./i3.nix
    ./kde.nix
  ];
  
  desktop = {
    misc.enable = lib.mkDefault true;
    default-fonts.enable = lib.mkDefault true;
    i3.enable = lib.mkDefault false;
    plasma.enable = lib.mkDefault false;
  };
  # xserver.enable = lib.mkIf i3.enable true;
  # wal.enable = lib.mkIf i3.enable true;

}
