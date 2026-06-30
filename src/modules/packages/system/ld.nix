{ pkgs, config, lib, ... }:

{
  options = {
    system-config.ld.enable = lib.mkEnableOption "Enable dynamic linking.";
  };
  
  config = lib.mkIf config.system-config.ld.enable {
    programs.nix-ld = {
      enable = true;
    };
  };
}
