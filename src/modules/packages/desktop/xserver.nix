{ config, lib, pkgs, ... }:

{
  options = {
    desktop.xserver.enable = lib.mkEnableOption "Use an xserver for your desktop.";
  };

  config = lib.mkIf config.desktop.xserver.enable {
    services.xserver = {
      enable = true;
      displayManager = {
        # Lightdm and i3 do not get along for some reason.
        lightdm = {
          enable = true;
          # background = /home/pines/Pictures/Wallpapers/1678704649268102.png;
          greeters.gtk = {
            enable = true;
          indicators = [
            "~host"
            "~spacer"
            "~clock"
            "~spacer"
            "~session"
            "~a11y"
            "~power"
          ];
          cursorTheme.size = 32;
          extraConfig = ''
          font-name = sans
          user-background = true
          '';
          };
        };
      };

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
