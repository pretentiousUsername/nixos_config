{ pkgs, config, ... }:

{
  users.users.pines.packages = [
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
}
