{ lib, config, pkgs, ... }:

{
  imports = [
    ./screenshots.nix
    ./editors.nix # IT KICKS LIKE A SLEEP TWITCH! (BEEWEEEEEEEOOOOO BEEWEEEEEEOOOOOOO)
    ./cheese.nix
  ];

  graphics = {
    editors.enable = lib.mkDefault true;
    screenshots.enable = lib.mkDefault true;
    cheese.enable = lib.mkDefault true; # they took all me magnets
  };
}
