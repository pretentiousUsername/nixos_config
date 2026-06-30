{ config, pkgs }:

{
  users.users.pines.packages = [
    audacious
    mpv
    # cmus  # I *might* use this
  ];
}
