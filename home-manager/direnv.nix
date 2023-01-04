{ config, pkgs, libs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    stdlib = builtins.readFile ./dotfiles/direnvrc;
  };
}
