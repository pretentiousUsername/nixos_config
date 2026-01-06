{ config, hardware, ... }:

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
}
