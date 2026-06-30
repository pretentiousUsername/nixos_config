{ config, lib }:

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
    keyring.enable = lib.mkDefaultOption true;
    sops.enable = lib.mkDefaultOption true;
    audio.enable = lib.mkDefaultOption true;
    firewall.enable = lib.mkDefaultOption true;
    printing.enable = lib.mkDefaultOption false;
    syncthing.enable = lib.mkDefaultOption false;
  };
}
