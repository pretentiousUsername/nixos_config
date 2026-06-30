{ config, pkgs, lib, ... }:

{
  options = {
    internet.chromium = lib.mkEnabledOption "Enable Chromium.";
  };

  packages = lib.mkIf config.internet.chromium {
    users.users.pines.packages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
