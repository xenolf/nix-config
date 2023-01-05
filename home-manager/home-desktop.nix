{ input, lib, config, pkgs, nixpkgs-unstable, nixgl, devenv, ... }:
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
    ./kitty.nix
    ./nvim.nix
    ./lazygit.nix
    ./helix.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
      nixgl.overlay
    ];
    # Configure nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  fonts.fontconfig.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "azhwkd";
    homeDirectory = "/home/azhwkd";
    packages = [
      pkgs.iosevka
      pkgs.fira-code
      (pkgs.nerdfonts.override { fonts = ["NerdFontsSymbolsOnly"]; })
      pkgs.gcc
      pkgs.ripgrep
      pkgs.nodejs
      pkgs.nixgl.auto.nixGLDefault
      unstable.helix
      devpkgs.devenv
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