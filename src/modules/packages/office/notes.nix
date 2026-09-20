{ pkgs, config, lib, ... }:

{
  options = {
    office.notes.enable = lib.mkEnableOption "Enable note-taking stuff.";
  };

  config = lib.mkIf config.office.misc.enable {
    users.users.pines.packages = with pkgs; [
      anytype
      zettlr 
    ];
  };
}
