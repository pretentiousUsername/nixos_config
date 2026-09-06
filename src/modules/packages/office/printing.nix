{ pkgs, config, lib, ... }:

{
  options = {
    office.printing.enable = lib.mkEnableOption "Enable printing stuff.";
  };

  config = lib.mkIf config.office.printing.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    services.printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };
  };
}
