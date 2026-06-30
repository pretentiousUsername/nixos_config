{ config, pkgs }:

{
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wireguard-tools
  ];
}
