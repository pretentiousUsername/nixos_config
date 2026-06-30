# configuration.nix

{ pkgs, inputs, config, ... }:

{

  imports =
    [
      inputs.sops-nix.nixosModules.sops
    ];

  environment.systemPackages = [
    sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  
  sops.age.keyFile = "/home/pines/.config/sops/age/keys.txt";

  # Kept this in here by mistake, whoops! Anyways, this is copied from
  # VimJoyer's tutorial.

  # sops.secrets.example-key = { };
  # sops.secrets."myservice/my_subdir/my_secret" = {
  #   owner = "sometestservice";
  # };

  # users.users.pines = {
  # };

}
