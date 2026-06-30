{ config, pkgs, lib, ... }:

{
  options = {
    development.devenv.enable = lib.mkEnableOption "Enable devenv.";
  };

  config = lib.mkIf config.development.devenv.enable {
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
