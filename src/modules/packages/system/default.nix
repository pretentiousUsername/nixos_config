{ config, lib, pkgs, ... }:

{
  imports = [
    ./archive.nix
    ./audio.nix
    ./ld.nix
    ./network.nix
    ./shell.nix
    ./misc.nix
  ];

  system-config = {
    archive.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    ld.enable = lib.mkDefault true;
    network.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
    misc.enable = lib.mkDefault true;
  };
}
