{ config, pkgs-unstable }:

{
  users.users.pines.packages = with pkgs-unstable; [ 
    supercollider-with-plugins
  ];

  programs.nix-ld.libraries = with pkgs; [
    fftw
    fftwFloat
  ];
}
