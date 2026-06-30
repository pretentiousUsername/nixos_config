{ config, pkgs, lib, ... }:

{
  options = {
    graphics.screenshots.enable = lib.mkEnableOption "Enable screenshots on your PC.";
  };

  config = lib.mkIf config.graphics.screenshots.enable {
    users.users.pines.packages = with pkgs; [
      flameshot
    ];
  };
}
