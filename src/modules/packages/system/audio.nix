{ config, lib, pkgs, ... }:

{
  options = {
    system-config.audio.enable = lib.mkEnableOption "Enable audio.";
  };

  config = lib.mkIf config.system-config.audio.enable {
    environment.systemPackages = with pkgs; [
      qjackctl
      pamixer
      pavucontrol
    ];
  };
}
