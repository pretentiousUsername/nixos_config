{ config, pkgs, lib }:

{
  options = {
    system-config.archive.enable = lib.mkEnableOption "Enable archiving tools.";
  };

  config = lib.mkIf config.system-config.archive.enable {
    users.users.pines.packages = with pkgs; [
      atool
      gzip
      zip
      unzip
    ];
  };
}
