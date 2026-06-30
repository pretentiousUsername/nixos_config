{ config, pkgs, lib }:

{
  options = {
    programming.neovim.enable = lib.mkEnableOption "Use neovim";
  };

  config = lib.mkIf config.programming.neovim.enable {
    users.users.pines.packages = [
      vimPlugins.nvim-treesitter
      lua
      luajit
      luarocks  # necessary for my neovim config
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      withPython3 = true;
    };
  };
}
