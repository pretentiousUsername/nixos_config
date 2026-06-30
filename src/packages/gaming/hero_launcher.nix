{ pkgs, config }:

{
  users.users.pines.packages = [ pkgs.heroic ];
}
