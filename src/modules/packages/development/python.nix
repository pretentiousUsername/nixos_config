{ config, lib, pkgs, ... }:

{
  options = {
    development.python.enable = lib.mkEnableOption "Enable Python.";
  };

  config = lib.mkIf config.development.python.enable {
    environment.systemPackages = (with pkgs; [
      python3
      python3Pkgs.numpy
    ]) ++
    (with pkgs.python314Packages; [
      numpy
      scipy
      matplotlib
      jax
    ]);
  };
}
