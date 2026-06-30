{ lib, config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./misc.nix
  ];

  office = {
    fonts.enable = lib.mkDefault true;
    misc.enable = lib.mkDefault true;
  };
}
