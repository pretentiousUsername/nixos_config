{ config, lib, pkgs, ... }:

{
  imports = [
    ./xserver.nix
    ./wal.nix
  ];

  options = {
    desktop.i3.enable = lib.mkEnableOption "Use i3.";
  };

  config = lib.mkIf config.desktop.i3.enable {

    # Enable the Xorg server and PyWal/wpgtk if you use i3.
    desktop.xserver.enable = true;
    desktop.wal.enable = true;

    environment.systemPackages = with pkgs; [
      # i3 uses dex to run in its config file. I should check if that's necessary
      # or not.
      dex
    ];

    services.xserver.windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status-rust
        i3lock
        i3blocks
        i3status
        feh
        dunst
        rofi
      ];
    };
  };
}
