{ config, pkgs, lib }:

{
  options = {
    programming.hugo.enable = lib.mkEnableOption "Enables Hugo.";
  };

  config = lib.mkIf config.programming.hugo.enable {
    users.users.pines.packages = [
      hugo
    ];
  };
}
