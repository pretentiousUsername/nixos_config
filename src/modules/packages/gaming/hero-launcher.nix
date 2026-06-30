{ pkgs, config, lib }:

{
  options = {
    gaming.heroic-launcher.enable = lib.mkDefault "Enable Heroic Launcher.";
  };

  config = lib.mkIf config.gaming.heroic-launcher.enable {
  users.users.pines.packages = [ pkgs.heroic ];
  };
}
