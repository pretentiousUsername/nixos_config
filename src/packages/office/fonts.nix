{ pkgs, config, ... }:

{
  users.users.pines.packages = with pkgs; [
    inter
    stix-two
    julia-mono
    corefonts
    vista-fonts
  ];
}
