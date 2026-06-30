{ config, pkgs, lib, ... }:

{
  options = {
    desktop.misc.enable = lib.mkEnableOption "Use miscellaneous options";
  };

  config = lib.mkIf config.desktop.misc.enable {
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      brightnessctl
    ];
  };
}
