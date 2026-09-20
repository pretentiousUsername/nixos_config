{ lib, config, pkgs, ... }:

{
  imports = [
    ./finance.nix
    ./libreoffice.nix
    ./notes.nix
    ./printing.nix
    ./typesetting.nix
    ./utils.nix
  ];

  office = {
    finance.enable = lib.mkDefault false;
    libreoffice.enable = lib.mkDefault false;
    notes.enable = lib.mkDefault false;
    typesetting.enable = lib.mkDefault false;
    printing.enable = lib.mkDefault false;
    utils.enable = lib.mkDefault false;
  };
}
