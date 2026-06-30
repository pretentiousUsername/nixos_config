{ config, pkgs, lib, ... }:

{
  options = {
    development.nixpkgs.enable = lib.mkEnableOption "Help maintain nixpkgs.";
  };

  config = lib.mkIf config.development.nixpkgs.enable {
    users.users.pines.packages = with pkgs; [
      nixpkgs-fmt
      nixpkgs-lint
      nixpkgs-review
    ];
  };
}
