{ config, lib, pkgs, ... }:

{
  options = {
    desktop.xserver.enable = lib.mkEnableOption "Use an xserver for your desktop.";
  };

  config = lib.mkIf config.desktop.xserver.enable {
    services.xserver = {
      enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    xdg = {
      autostart.enable = true;
    };

    services.picom = {
      enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;


    environment.systemPackages = with pkgs; [
      xrandr
      arandr
      xss-lock
      # required to make i3 get the media keys and stuff---it's quite handy
      xorg.xf86inputevdev
      xclip
      xev
      xbacklight
    ];
  };
}
