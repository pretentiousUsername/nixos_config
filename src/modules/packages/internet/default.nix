{ config, lib, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./chat.nix
    ./chromium.nix
  ];

  internet = {
    firefox.enable = lib.mkDefault true;
    chat.enable = lib.mkDefault true;
    chromium.enable = lib.mkDefault false;
  };
}
