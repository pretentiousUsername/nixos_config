{ config, lib, pkgs }:

{
  options = {
    desktop.wal.enable = lib.mkEnableOption
      "Use pywal and wpg for customization.";
  };

  config = lib.mkIf config.desktop.wal.enable {
    # enable dconf (for wpgtk)
    programs.dconf.enable = true;

    users.users.pines.packages = with pkgs; [
      wpgtk
      pywal16
    ];
  };
}
