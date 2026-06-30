{ config, pkgs, lib, ... }:

{
  options = {
    internet.chromium.enable = lib.mkEnableOption "Enable Chromium.";
  };

  config = lib.mkIf config.internet.chromium.enable {
    users.users.pines.packages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
