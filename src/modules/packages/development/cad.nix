{ config, lib, pkgs, ... }:

{
  options = {
    programming.cad.enable = lib.mkEnableOption "Enable CAD.";
  };

  config = lib.mkIf programming.cad.enable {
    users.users.pines.packages = with pkgs; [
      kicad
      freecad
      elmerfem
    ];
  };
}
