{ config, pkgs, libs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
