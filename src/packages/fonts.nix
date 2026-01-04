{ config, pkgs }:

{
    packages = with pkgs; [
      inter
      stix-two
      julia-mono
    ];
}
