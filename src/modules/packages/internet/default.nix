{ config, lib, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./chat.nix
    ./chromium.nix
  ];

  internet = {
    firefox.enable = lib.mkDefaultValue true;
    chat.enable = lib.mkDefaultValue true;
    chromium.enable = lib.mkDefaultValue false;
  };
}
