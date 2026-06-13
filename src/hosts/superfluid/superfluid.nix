{ config, networking, hardware, services, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    ];

    networking.hostName = "superfluid"; # Define your hostname.

    environment.variables = {
        GDK_SCALE = "1.25";
        GDK_DPI_SCALE = "1.25";
        # GDK_DPI_SCALE = "1.00";
        QT_QUTO_SCREEN_SCALE_FACTOR = "1.25";
        _JAVA_OPTIONS = "-Dsun.java2d.uiscale=1.25";
        MANWIDTH = 80;
    };

    # ALSA UCM prevents the microphone from working on Framework laptops for
    # some reason. (See <https://github.com/NixOS/nixos-hardware/issues/1603>.)
    services.pipewire.wireplumber.extraConfig.no-ucm = {
        "monitor.alsa.properties" = {
            "alsa.use-ucm" = false;
        };
    };

    services.libinput.touchpad.disableWhileTyping = true;
    services.fwupd.enable = true;

    # !!! DON'T UPDATE THIS UNLESS YOU KNOW WHAT YOU'RE DOING !!!
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
}
