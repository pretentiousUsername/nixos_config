{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options = {
    system-services.syncthing.enable = lib.mkEnableOption "Enable the SyncThing service.";
  };

  config = lib.mkIf config.system-services.syncthing.enable {
    # Enable/configure Synthing
    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      settings = {
        gui = {
          user = ${sops.secrets."syncthing/username"};
          password = ${sops.secrets."syncthing/password"};
        };
      };
    };

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };
}
