{ config, lib, pkgs }:

{
  options = {
    programming.python.enable = lib.mkEnableOption "Enable Python.";
  };

  config = lib.mkIf config.programming.python.enable {
    environment.systemPackages = with pkgs; [
      python
    ];
  };
}
