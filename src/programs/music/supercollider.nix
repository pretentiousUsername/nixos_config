{ config, pkgs-unstable }:

{
  users.users.pines.packages = with pkgs-unstable; [ 
    supercollider-with-plugins
  ];
}
