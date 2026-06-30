{ config, pkgs, lib }:

{
  options = {
    graphics.cheese.enable = lib.mkEnableOption "Enable Cheese.";
  };

  config = lib.mkIf config.graphics.cheese.enable {
    users.users.pines.packages = [
      cheese
    ];
  };
}
