{ config, pkgs, libs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; [
    ];
  };

  xdg.configFile = {
    nvim = {
      source = ./dotfiles/nvim;
      recursive = true;
    };
  };
}
