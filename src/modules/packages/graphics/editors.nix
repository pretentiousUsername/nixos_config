{ config, pkgs, lib, ... }:

{
  options = {
    graphics.editors.enable = lib.mkEnableOption "Enable graphics editors.";
  };

  config = lib.mkIf config.graphics.editors.enable {
    users.users.pines.packages = with pkgs; [
      decker
      imagemagick
      ffmpeg
      gimp
      inkscape
    ];
  };
}
