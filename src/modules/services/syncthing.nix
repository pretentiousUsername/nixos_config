{ pkgs, config, inputs, lib, ... }:

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
      user = "pines";
      openDefaultPorts = true;
      guiPasswordFile = config.sops.secrets."syncthing/password".path;
      dataDir = "/home/pines/";
      settings = {
        folders = {
          "Music" = {
            path = "/home/pines/Music";
          };
        };
        options = {
          urAccepted = -1;
        };
        devices = {
          "molecule" = { id = "QXT5WWC-XV7VLUM-M643TF6-DUNJZDW-JECKVXZ-ROW76TP-ZJB5HWA-T3U32Q2"; };
          "superfluid" = { id = "T4HGIGS-TUVTXBS-TUXLT5T-WBXJWBC-FRMZOYM-5UXQB2E-4FPH6MR-UVFA5QD"; };
        };
        gui.user = "pines";
      };
    };
  };
}
