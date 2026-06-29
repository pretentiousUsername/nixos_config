{ config, ... }:

{
    windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
            i3status-rust
            i3lock
            i3blocks
            i3status
        ];
    };

  };

  services.displayManager = {
        defaultSession = "none+i3";
        sddm.enable = false;
  };
}
