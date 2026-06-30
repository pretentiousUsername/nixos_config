{ config, pkgs, lib }:

{
  options = {
    desktop.misc-desktop.enable = lib.mkEnableOption "Use miscellaneous options";
  };

  config = lib.mkIf config.misc-desktop.enable {
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      brightnessctl
    ];
  };
}
