{ lib, config, pkgs, ... }:

{
  imports = [
    ./misc.nix
  ];

  office = {
    misc.enable = lib.mkDefault true;
  };
}
