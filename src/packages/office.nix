{ config, pkgs, ... }:

{
    officePackages = {
        packages = with pkgs; [
            pandoc
            texliveFull
            anytype
            zathura
            anytype
        ];
    };
}
