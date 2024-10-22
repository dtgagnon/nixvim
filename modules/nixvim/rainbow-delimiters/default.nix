{ lib, ... }:
let theme = lib.spirenix.theme.everforest;
in {
  highlight = {
    RainbowDelimiterBlue.fg = theme.everforest7;
    RainbowDelimiterOrange.fg = theme.everforest12;
    RainbowDelimiterGreen.fg = theme.everforest14;
    RainbowDelimiterViolet.fg = theme.everforest15;
    RainbowDelimiterCyan.fg = theme.everforest9;
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
