{ config, pkgs, libs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    plugins = [
    ];

    envExtra = let homeDirectory = config.home.homeDirectory;
    in ''
    export PATH="${homeDirectory}/bin:${homeDirectory}/.local/bin:${homeDirectory}/.cargo/bin:${homeDirectory}/go/bin:''${PATH}"
    if [ -e /home/azhwkd/.nix-profile/etc/profile.d/nix.sh ]; then . /home/azhwkd/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';

    shellAliases = {
      diff = "${pkgs.diffutils}/bin/diff -u --color=auto";
      dir = "dir --color=auto";
    };

    oh-my-zsh = {
      enable = true;
      theme = "cypher";
      plugins = [
        "git"
        "sudo"
        "ssh-agent"
      ];
    };
  };
}
