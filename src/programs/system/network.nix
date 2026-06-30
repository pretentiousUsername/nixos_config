{ config, pkgs }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wireguard-tools
  ];
}
