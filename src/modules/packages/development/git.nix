{ config, pkgs, lib, ... }:

{
  options = {
    programming.git.enable = lib.mkEnableOption "Enable git.";
  };

  config = lib.mkIf config.programming.git.enable {
    programs.git = {
      enable = true;
    };
  };
}
