{ config, lib, pkgs, ... }:

{
  options = {
    system-services.printing.enable = lib.mkEnableOption "Enable printing services.";
  };

  config = lib.mkIf config.system-services.printing.enable {
    environment.systemPackages = with pkgs; [
      hplip  # printing drivers
    ];
  
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}
