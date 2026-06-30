{ config, pkgs, lib, ... }:

{
  options = {
    development.git.enable = lib.mkEnableOption "Enable git.";
  };

  config = lib.mkIf config.development.git.enable {
    programs.git = {
      enable = true;
    };
  };
}
