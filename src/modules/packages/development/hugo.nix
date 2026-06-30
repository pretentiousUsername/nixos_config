{ config, pkgs, lib, ... }:

{
  options = {
    development.hugo.enable = lib.mkEnableOption "Enables Hugo.";
  };

  config = lib.mkIf config.development.hugo.enable {
    users.users.pines.packages = with pkgs; [
      hugo
    ];
  };
}
