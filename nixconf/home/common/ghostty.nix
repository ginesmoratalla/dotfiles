{ pkgs, ... }:
{

  programs.ghostty = {
    enable = true;

    package =
      if pkgs.stdenv.hostPlatform.isDarwin
      then pkgs.ghostty-bin
      else pkgs.ghostty;

    settings = {

      window-padding-y = "9,4";
      window-padding-x = 17;

      # Keybindings
      macos-option-as-alt = "left";

      #fx
      custom-shader = "${../../../ghostty-shaders/cursor_tail.glsl}";

      # Font
      font-family = "Ioskeley Mono";
      font-size = 12;


      # Fonts
      theme = "Electron Highlighter";
      background = "0A0A0A";
      macos-icon = "holographic";

    };
  };
}
