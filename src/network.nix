{ config, pkgs }:

{
  environment.systemPackages = with pkgs; [
    fish
    ueberzug
    killall
    curl
    tmux
    wget
  ];
}
