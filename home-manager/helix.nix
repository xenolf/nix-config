{ config, pkgs, lib, ... }:

{
  xdg.configFile = {
    helix = {
      source = ./dotfiles/helix;
      recursive = true;
    };
  };
}
