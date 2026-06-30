{ config, pkgs, lib, ... }:

{
  options = {
    programming.neovim.enable = lib.mkEnableOption "Use neovim";
  };

  config = lib.mkIf config.programming.neovim.enable {
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
