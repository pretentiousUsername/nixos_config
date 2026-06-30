{ config, lib, ... }:

{
  imports = [
    ./cad.nix
    ./misc.nix
    ./devenv.nix
    ./git.nix
    ./hugo.nix
    ./lazygit.nix
    ./neovim.nix
    ./nixpkgs.nix
    ./python.nix
  ];

  development = {
    cad.enable = lib.mkDefault false;
    misc.enable = true;
    git.enable = lib.mkDefault true;
    lazygit.enable = lib.mkDefault true;
    neovim.enable = lib.mkDefault true;
    python.enable = lib.mkDefault true;
    devenv.enable = lib.mkDefault true;
    hugo.enable = lib.mkDefault true;
    nixpkgs.enable = lib.mkDefault true;
  };
}
