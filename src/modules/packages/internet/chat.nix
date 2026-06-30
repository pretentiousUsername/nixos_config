{ config, pkgs, lib, ... }:

{
  options = {
    internet.chat.enable = lib.mkEnableOption "Enable chat programs.";
  };

  config = lib.mkIf config.internet.chat.enable {
    users.users.pines.packages = with pkgs; [
      discord
    ];
  };
}
