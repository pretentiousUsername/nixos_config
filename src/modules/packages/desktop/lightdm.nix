{ config, lib, pkgs, ... }:

{
  options = {
    desktop.lightdm.enable = lib.mkEnableOption "Use LightDM.";
  };

  config = lib.mkIf config.desktop.lightdm.enable {
    services.xserver.displayManager.lightdm = {
      enable = true;
      # background = /home/pines/Pictures/Wallpapers/1678704649268102.png;
      greeters.slick = {
        enable = true;
        font.name = "Inter 11";
        font.package = pkgs.inter;
      };
    };
  };
}
