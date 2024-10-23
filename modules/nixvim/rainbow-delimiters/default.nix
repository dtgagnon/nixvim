{ lib, nvimTheme, ... }:
let
  theme = lib.spirenix.theme.${nvimTheme};
in
{
  highlight = {
    RainbowDelimiterBlue.fg = theme.${nvimTheme} 7;
    RainbowDelimiterOrange.fg = theme.${nvimTheme} 12;
    RainbowDelimiterGreen.fg = theme.${nvimTheme} 14;
    RainbowDelimiterViolet.fg = theme.${nvimTheme} 15;
    RainbowDelimiterCyan.fg = theme.${nvimTheme} 9;
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
