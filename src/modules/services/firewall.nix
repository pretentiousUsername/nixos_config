{ config, lib, pkgs }:

{
  options = {
    system-services.firewall.enable = lib.mkEnableOption "Enable networking firewall.";
  };

  config = lib.mkIf config.system-services.firewall.enable {
    networking.firewall.enable = true;
  };
}
