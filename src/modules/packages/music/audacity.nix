{ config, pkgs, lib }:

{
  options = {
    music.audacity.enable = lib.mkEnableOption "Enable Audacity.";
  };
  config = lib.mkIf config.music.audacity.enable {
    users.users.pines.packages = with pkgs; [
      audacity
    ];
  };
}
