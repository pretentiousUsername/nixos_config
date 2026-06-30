{ config, pkgs, lib, ... }:

{
  options = {
    graphics.screenshot.enable = lib.mkEnableOption "Enable screenshots on your PC.";
  };

  config = lib.mkIf config.graphics.screenshot.enable {
    users.users.pines.packages = with pkgs; [
      flameshot
    ];
  };
}
