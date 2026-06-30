{ config, pkgs, lib, ... }:

{
  options = {
    development.lazygit.enable = lib.mkEnableOption "Enable lazygit.";
  };

  config = lib.mkIf config.development.lazygit.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
