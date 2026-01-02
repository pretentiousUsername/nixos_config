{ config, ... }:

{
    nix = {
        settings = {
            experimental-features = [ "flakes" "nix-command" ];
        };
    };
}
