
{ config, pkgs, lib, ... }:

{
  options = {
    internet.misc.enable = lib.mkEnableOption "Enable miscellaneous packages.";
  };

  config = lib.mkIf config.internet.misc.enable {
    users.users.pines.packages = with pkgs; [
      persepolis
    ];
  };
}
