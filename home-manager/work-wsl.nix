{ input, lib, config, pkgs, nixpkgs-unstable, devenv, ... }:
let 
  unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
  devpkgs = devenv.packages.x86_64-linux;
in
{
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./nvim.nix
    ./lazygit.nix
    ./helix.nix
    ./gh.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";
    packages = [
      pkgs.ripgrep
      unstable.helix
      devpkgs.devenv
      pkgs.nodejs
      pkgs.gcc
      pkgs.nix-prefetch-scripts
      pkgs.dig
      pkgs.dotnet-sdk
      pkgs.omnisharp-roslyn
      pkgs.python3
      pkgs.python310Packages.pip
      pkgs.pipenv
      pkgs.cryptsetup
      pkgs.mtr
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";
}
