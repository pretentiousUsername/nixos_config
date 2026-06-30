{ config, pkgs }:

{
  environment.systemPackages = [
    adwaita-icon-theme
    brightnessctl
  ];
}
