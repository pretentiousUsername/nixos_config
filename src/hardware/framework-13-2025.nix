{ config, hardware, services, ... }:

{
    imports = [
        <nixos-hardware/framework/13-inch/amd-ai-300-series>
    ];

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

    services.xserver.libinput.touchpad.disableWhileTyping = true;
}
