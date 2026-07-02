{ pkgs, config, lib, ... }:

{
  options = {
    system-config.fonts.enable = lib.mkEnableOption "Enable external fonts.";
  };

  config = lib.mkIf config.system-config.fonts.enable {
    environment.systemPackages = with pkgs; [
      inter
      stix-two
      julia-mono
      corefonts
      vista-fonts
    ];

  };
}
