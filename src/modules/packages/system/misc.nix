{ config, pkgs, lib, ... }:

{
  options = {
    system-config.misc.enable = lib.mkEnableOption "Enable misc. stuff.";
  };

  config = lib.mkIf config.system-config.misc.enable {
    users.users.pines.packages = with pkgs; [
      alacritty-graphics
      hyfetch  # yep
      btop
      thunar
      ranger
      lxappearance
      gparted
    ];
  };
}
