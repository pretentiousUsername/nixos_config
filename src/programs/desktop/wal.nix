{ config, pkgs }:

{
  # enable dconf (for wpgtk)
  programs.dconf.enable = true;

  users.users.pines.packages = with pkgs; [
    wpgtk
    pywal16
  ];
}
