{ config, ... }:

{
    fonts = {
        fontconfig = {
            antialias = true;
            hinting.enable = true;
            hinting.style = "slight";
            subpixel.rgba = "rgb";
            defaultFonts = {
                serif = [ "Stix Two Text" ];
                sansSerif = [ "Inter" ];
                monospace = [ "JuliaMono Nerd Font" ];
            };
        };
    };
}
