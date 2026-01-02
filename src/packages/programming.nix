{ config, pkgs, ... }:

{
    packages = with pkgs; [
        lazygit

        python313
        python313Packages.numpy
        python313Packages.scipy
        python313Packages.matplotlib
        python313Packages.pandas

        gcc
        
        julia-bin
    ];
}
