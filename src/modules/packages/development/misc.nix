{ config, pkgs, lib, ... }:

{
  options = {
    development.misc.enable = lib.mkEnableOption "Misc. stuff.";
  };

  config = lib.mkIf config.development.misc.enable {
    users.users.pines.packages = with pkgs; [
      fzf
    ];
  };
}
