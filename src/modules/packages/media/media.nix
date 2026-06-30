{ config, pkgs }:

{
  options = {
    media.enable = lib.mkEnableOption "Enable media programs.";
  };

  config = lib.mkIf config.media.enable {
    users.users.pines.packages = [
      audacious
      mpv
      # cmus  # I *might* use this
    ];
  };
}
