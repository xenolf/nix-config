{ config, pkgs, libs, ... }:

{
  programs.gh = {
    enable = true;

    enableGitCredentialHelper = true;
  };
}
