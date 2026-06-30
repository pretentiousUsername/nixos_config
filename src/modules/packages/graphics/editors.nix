{ config, pkgs, lib, ... }:

{
  options = {
    graphics.editors.enable = lib.mkEnableOption "Enable graphics editors.";
  };

  config = lb.mkIf config.graphics.editors.enable {
    users.users.pines.packages = with pkgs; [
      decker
      imagemagick
      ffmpeg
      gimp
      inkscape
    ];
  };
}
