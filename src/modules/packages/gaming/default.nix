{ pkgs, config, lib, ... }:

{
  imports = [
    ./steam.nix
    ./hero-launcher.nix
  ];

  gaming = {
    steam.enable = lib.mkDefault false;
    heroic-launcher.enable = lib.mkDefault false;
  };
}
