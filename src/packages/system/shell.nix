{ config, pkgs }:

{
  programs.bash.interactiveShellInit =
    ''
    eval "$(direnv hook bash)"
    '';

  environment.systemPackages = with pkgs; [
    fish
    ueberzug
    killall
    curl
    tmux
    wget
  ];
}
