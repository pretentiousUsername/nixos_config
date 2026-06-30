{ config, lib, pkgs, ... }:

{
  options = {
    development.python.enable = lib.mkEnableOption "Enable Python.";
  };

  config = lib.mkIf config.development.python.enable {
    environment.systemPackages = with pkgs; [
      python3
    ];
  };
}
