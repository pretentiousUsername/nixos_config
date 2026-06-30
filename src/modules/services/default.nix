{ config, lib, ... }:

{
  imports = [
    ./audio.nix
    ./firewall.nix
    ./keyring.nix
    ./printing.nix
    ./sops.nix
    ./syncthing.nix
  ];

  system-services = {
    gnome-keyring.enable = lib.mkDefault true;
    sops.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    firewall.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault false;
    syncthing.enable = lib.mkDefault false;
  };
}
