{ lib, config, pkgs, ... }:

{
  imports = [
    ./screenshots.nix
    ./editors.nix  # IT KICKS LIKE A SLEEP TWITCH! (BEEWEEEEEEEOOOOO BEEWEEEEEEOOOOOOO)
    ./webcam.nix
  ];

  graphics = {
    editors.enable = lib.mkDefault true;
    screenshots.enable = lib.mkDefault true;
    webcam.enable = lib.mkDefault true;
  };
}
