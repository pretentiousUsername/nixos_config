{ config, pkgs }:

{
  environment.systemPackages = with pkgs; [
    qjackctl
    pamixer
    pavucontrol
  ];
}
