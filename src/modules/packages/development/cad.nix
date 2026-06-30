{ config, lib, pkgs, ... }:

{
  options = {
    development.cad.enable = lib.mkEnableOption "Enable CAD.";
  };

  config = lib.mkIf config.development.cad.enable {
    users.users.pines.packages = with pkgs; [
      kicad
      freecad
      elmerfem
    ];
  };
}
