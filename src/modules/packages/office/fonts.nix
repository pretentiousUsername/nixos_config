{ pkgs, config, lib, ... }:

{
  options = {
    office.fonts.enable = lib.mkEnableOption "Enable external fonts.";
  };

  config = lib.mkIf config.office.fonts.enable {
    users.users.pines.packages = with pkgs; [
      inter
      stix-two
      julia-mono
      corefonts
      vista-fonts
    ];
  };
}
