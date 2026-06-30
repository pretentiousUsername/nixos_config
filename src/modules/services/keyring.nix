{ config, pkgs, lib, ... }:

{
  options = {
    system-services.gnome-keyring.enable = lib.mkEnableOption "Enable GNOME Keyring.";
  };

  config = lib.mkIf config.system-services.gnome-keyring.enable {
    services.gnome.gnome-keyring.enable = true;
  };
}
