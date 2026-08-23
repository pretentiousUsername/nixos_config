{ config, lib, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./chat.nix
    ./chromium.nix
    ./misc.nix
  ];

  internet = {
    firefox.enable = lib.mkDefault true;
    chat.enable = lib.mkDefault true;
    chromium.enable = lib.mkDefault false;
    misc.enable = lib.mkDefault true;
  };
}
