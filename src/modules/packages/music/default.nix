{ lib, config, pkgs, ... }:

{
  imports = [
    ./audacity.nix
    ./supercollider.nix
  ];

  music = {
    audacity.enable = lib.mkDefault true;
    supercollider.enable = lib.mkDefault true;
  };
}
