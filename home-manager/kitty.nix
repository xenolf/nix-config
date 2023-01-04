{ config, pkgs, lib, ... }:
let 
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${lib.getExe pkgs.nixgl.auto.nixGLDefault} $bin \$@" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
in
{
  xdg.configFile."kitty/themes/mocha.conf".source = ./dotfiles/kitty-mocha.conf;
  programs.kitty = {
    enable = true;
    package = nixGLWrap pkgs.kitty;
    
    settings = {
      font_size = "12.0";
      disable_ligatures = "cursor"; 

      # Window layout
      hide_window_decorations = "titlebar-only";

      # Tab bar
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_title_template = "Tab {index}: {title}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";
      tab_activity_symbol = "";
    };

    font = {
      name = "Iosevka";
      package = pkgs.iosevka;
    };
    
    extraConfig = ''
      include ~/.config/kitty/themes/mocha.conf
    '';

    keybindings = {
      "f1" = "launch --cwd=current";
      "f2" = "launch --cwd=current --type=tab";
    };
  };
}
