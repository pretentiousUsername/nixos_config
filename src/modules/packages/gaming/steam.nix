{ config, pkgs, lib }:

{

  options = {
    gaming.steam.enable = lib.mkDefault "Enable Steam.";
  };

  config = lib.mkIf config.gaming.steam.enable {
    programs.steam = {
      enable = true;
    };
  };
}
