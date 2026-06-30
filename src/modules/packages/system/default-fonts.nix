{ config, lib, ... }:

{
  options = {
    desktop.default-fonts.enable = lib.mkEnableOption "Enable default fonts.";
  };
  
  config = lib.mkIf config.desktop.default-fonts.enable {
  };
}
