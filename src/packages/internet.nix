{ pkgs, ... }:

{
    packages = {
        list = with pkgs; [
            floorp-bin;
        ];
    };
}
