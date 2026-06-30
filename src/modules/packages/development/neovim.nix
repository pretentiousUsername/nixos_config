{ config, pkgs, lib, ... }:

{
  options = {
    development.neovim.enable = lib.mkEnableOption "Use neovim";
  };

  config = lib.mkIf config.development.neovim.enable {
    users.users.pines.packages = with pkgs; [
      vimPlugins.nvim-treesitter
      lua
      luajit
      luarocks  # necessary for my neovim config
    ];

    programs.neovim = {
      # package = [ pkgs.neovim ];
      enable = true;
      defaultEditor = true;
      withPython3 = true;
    };
  };
}
