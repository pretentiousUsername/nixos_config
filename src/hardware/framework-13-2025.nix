{ config, ... }:

{
    imports = [
        <nixos-hardware/framework/13-inch/amd-ai-300-series>
    ];

    services.xserver.dpi = 201;
}
