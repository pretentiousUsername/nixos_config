{ config, pkgs, lib, ... }:

{
  options = {
    system-config.network.enable = lib.mkEnableOption "Enable networking.";
  };

  config = lib.mkIf config.system-config.network.enable {
    # Enable networking
    networking.networkmanager.enable = true;

    environment.systemPackages = with pkgs; [
      networkmanagerapplet
      wireguard-tools
    ];
  };
}
