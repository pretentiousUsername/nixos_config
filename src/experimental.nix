{ config }:

{
    nix = {
        settings = {
            experimental-features = [ "nix-command" ];
        };
    };
};
