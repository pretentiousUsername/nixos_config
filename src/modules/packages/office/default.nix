{ lib, config, pkgs, ... }:

{
  imports = [
    ./misc.nix
    ./printing.nix
  ];

  office = {
    misc.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault false;
  };
}
