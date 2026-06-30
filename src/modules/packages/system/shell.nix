{ config, pkgs, lib }:

{
  options = {
    system-config.shell.enable = lib.mkEnableOption "Enable shell stuff.";
  };

  config = lib.mkIf config.system-config.shell.enable {
    environment.systemPackages = with pkgs; [
      fish
      ueberzug
      killall
      curl
      tmux
      wget
    ];
  };
}
