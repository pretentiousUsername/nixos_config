{ config, pkgs, lib, ... }:

{
  options = {
    programming.nixpkgs.enable = lib.mkEnableOption "Help maintain nixpkgs.";
  };

  config = lib.mkIf config.programming.nixpkgs.enable {
    users.users.pines.packages = [
      nixpkgs-fmt
      nixpkgs-lint
      nixpkgs-review
    ];
  };
}
