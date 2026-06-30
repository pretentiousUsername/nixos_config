{ config, pkgs }:

{
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
}
