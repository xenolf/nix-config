{ config, pkgs, libs, ... }:

{
  programs.git = {
    enable = true;
    userName = "xenolf";
    userEmail = "xenolf@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    aliases = {
      st = "status";
    };
  };
}
