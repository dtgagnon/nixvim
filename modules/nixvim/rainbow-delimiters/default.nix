{ lib, ... }:
let
  inherit (lib.spirenix-nvim) themeName;
  theme = lib.spirenix-nvim.colors.${themeName};
in
{
  highlight = with theme; {
    RainbowDelimiterBlue.fg = base07;
    RainbowDelimiterOrange.fg = base0C;
    RainbowDelimiterGreen.fg = base0E;
    RainbowDelimiterViolet.fg = base0F;
    RainbowDelimiterCyan.fg = base09;
  };

  plugins = {
    rainbow-delimiters = {
      enable = true;
      highlight = [
        "RainbowDelimiterViolet"
        "RainbowDelimiterBlue"
        "RainbowDelimiterGreen"
        "RainbowDelimiterOrange"
        "RainbowDelimiterCyan"
      ];
    };
  };
}
