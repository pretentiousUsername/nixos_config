
{ pkgs, config, lib, ... }:

{
  options = {
    office.finance.enable = lib.mkEnableOption "Enable finance stuff.";
  };

  config = lib.mkIf config.office.misc.enable {
    users.users.pines.packages = with pkgs; [
      gnucash
    ];
  };
}
