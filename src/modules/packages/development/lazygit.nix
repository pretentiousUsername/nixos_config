{ config, pkgs, ... }:

{
  options = {
    programming.lazygit.enable = lib.mkEnableOption "Enable lazygit.";
  };

  config = lib.mkIf config.programming.lazygit.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
