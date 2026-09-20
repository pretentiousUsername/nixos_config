{ pkgs, config, lib, ... }:

{
  options = {
    office.utils.enable = lib.mkEnableOption "Enable office utilities.";
  };

  config = lib.mkIf config.office.misc.enable {
    users.users.pines.packages = with pkgs; [
      zathura
      deja-dup
      ghostscript
      poppler-utils
    ];
  };
}
