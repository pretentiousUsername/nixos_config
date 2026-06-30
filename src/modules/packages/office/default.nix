{ lib, config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./misc.nix
  ];

  office = {
    fonts.enable = lib.mkDefaultOption true;
    misc.enable = lib.mkDefaultOption true;
  };
}
