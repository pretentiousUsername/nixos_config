{ config, pkgs, lib, ... }:

{
  options = {
    media.enable = lib.mkEnableOption "Enable media programs.";
  };

  config = lib.mkIf config.media.enable {
    users.users.pines.packages = with pkgs; [
      audacious
      mpv
      rockbox-utility
      nicotine-plus
      # cmus  # I *might* use this
    ];
  };
}
