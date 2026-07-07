{ pkgs, inputs, lib, config, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options = {
    system-services.sops.enable = lib.mkEnableOption "Enable SOPS service.";
  };
  
  config = lib.mkIf config.system-services.sops.enable {
    environment.systemPackages = with pkgs; [
      sops
    ];

    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    
    sops.age.keyFile = "/home/pines/.config/sops/age/keys.txt";

    sops.secrets = {
      "syncthing/password" = { owner = "pines"; };
    };

    # services.syncthing.guiPasswordFile = sops.secrets."syncthing/password".path;
  };
}
