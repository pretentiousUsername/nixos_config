{ pkgs, config, lib, ... }:

{
  options = {
    office.misc.enable = lib.mkEnableOption "Enable office stuff.";
  };

  config = lib.mkIf config.office.misc.enable {
    users.users.pines.packages = with pkgs; [
      pandoc
      zotero
      haskellPackages.pandoc-crossref
      anytype
      zathura
      deja-dup
      texliveFull
      typst
      ghostscript
      poppler-utils
      libreoffice
    ];
  };
}
