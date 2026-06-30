{ config, pkgs, lib, ... }:

{
  options = {
    programming.misc.enable = lib.mkEnableOption "Misc. stuff.";
  };

  config = lib.mkIf config.programming.misc.enable {
    users.users.pines.packages = with pkgs; [
      fzf
    ];
  };
}
