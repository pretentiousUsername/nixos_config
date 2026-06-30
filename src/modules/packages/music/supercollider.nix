{ config, lib, pkgs-unstable }:

{
  options = {
    music.supercollider.enable = lib.mkEnableOption "Enable SuperCollider.";
  };

  config = lib.mkIf config.music.supercollider.enable {
    users.users.pines.packages = with pkgs-unstable; [ 
      supercollider-with-plugins
    ];

    programs.nix-ld.libraries = with pkgs; [
      fftw
      fftwFloat
    ];
  };
}
