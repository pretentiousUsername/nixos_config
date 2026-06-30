{ pkgs, config, lib, ... }:

{
  options = {
    system.fonts.enable = lib.mkEnableOption "Enable external fonts.";
  };

  config = lib.mkIf config.desktop.fonts.enable {
    environment.systemPackages = with pkgs; [
      inter
      stix-two
      julia-mono
      corefonts
      vista-fonts
    ];

    fonts = {
      fontconfig = {
        defaultFonts = {
          serif = [ "Stix Two Text" ];
          sansSerif = [ "Inter" ];
          monospace = [ "JuliaMono Nerd Font" ];
        };
      };
    };
  };
}
