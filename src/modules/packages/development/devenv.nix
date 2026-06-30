{ config, pkgs, lib, ... }:

{
  options = {
    programming.devenv.enable = lib.mkEnableOption "Enable devenv.";
  };

  config = lib.mkIf config.programming.devenv.enable {
    programs.direnv.enable = true;

    programs.bash.interactiveShellInit =
      ''
      eval "$(direnv hook bash)"
      '';

    environment.systemPackages = with pkgs; [
      devenv
    ];
  };
}
