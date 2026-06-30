{ pkgs, config, lib, ... }:

{
  options = {
    desktop.fonts.enable = lib.mkEnableOption "Enable external fonts.";
  };

  config = lib.mkIf config.desktop.fonts.enable {
    users.users.pines.packages = with pkgs; [
      inter
      stix-two
      julia-mono
      corefonts
      vista-fonts
    ];
  };
}
