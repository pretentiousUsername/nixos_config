{ pkgs, inputs, config, lib, ... }:
{
  options = {
    system-services.syncthing.enable = lib.mkEnableOption "Enable the SyncThing service.";
  };

  config = lib.mkIf config.system-services.syncthing.enable {
    # Enable/configure Synthing
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
    };

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
}
