{ pkgs, config, lib, ... }:

{
  options = {
    office.typesetting.enable = lib.mkEnableOption "Enable typesetting packages.";
  };

  config = lib.mkIf config.office.typesetting.enable {
    users.users.pines.packages = with pkgs; [
      pandoc
      haskellPackages.pandoc-crossref
      texliveFull
      typst
    ];
  };
}
