{ config, pkgs, ... }:

{
  users.users.pines.packages = [
    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
  ];
}
