{ config, pkgs, ... }:

{
    packages = with pkgs; [
      pandoc
      texliveFull
      anytype
      zathura
      lazygit
      anytype
    ];
  };
};
