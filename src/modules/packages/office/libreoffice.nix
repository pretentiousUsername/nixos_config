{ pkgs, config, lib, ... }:

{
  options = {
    office.libreoffice.enable = lib.mkEnableOption "Enable LibreOffice.";
  };

  config = lib.mkIf config.office.misc.enable {
    users.users.pines.packages = with pkgs; [
      libreoffice
    ];
  };
}
