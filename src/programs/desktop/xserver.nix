{ config }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      # Lightdm and i3 do not get along for some reason.
      lightdm = {
        enable = true;
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
        font-name = monospace
        user-background = true
        background = /home/pines/Pictures/Wallpapers/1678704649268102.png
        '';
      };
    };
  };

  xdg = {
    autostart.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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
}
