{ pkgs, lib, config }:

{
  options = {
    desktop.plasma.enable = lib.mkEnableOption "Enable KDE Plasma.";
  };

  config = lib.mkIf config.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
