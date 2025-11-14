{ lib
, config
, ...
}:
let
  inherit (lib) mkOption types mkDefault;
  inherit (lib.spirenix-nvim) colors;
in
{
  options = {
    themeName = mkOption {
      type = types.enum [
        "catppuccin-latte"
        "catppuccin-frappe"
        "catppuccin-macchiato"
        "catppuccin-mocha"
        "everforest"
        "everforest-dark-hard"
        "gruvbox"
        "gruvbox-material-dark-medium"
        "mountain"
        "ocean"
        "stylix"
        "tokyo-night"
      ];
      default = "gruvbox-material-dark-medium";
      description = "The color theme to use.";
    };
  };

  config = {
    # Always configure base16 with the selected theme
    # When themeName == "stylix", uses fallback colors from lib/colors/stylix.nix
    # mkDefault gives these lower priority so Stylix's .extend can override them
    colorschemes.base16 = {
      enable = true;
      setUpBar = false;
      colorscheme = mkDefault colors.${config.themeName};
      settings = {
        cmp = true;
        illuminate = false;
        indentblankline = true;
        lsp_semantic = true;
        mini_completion = true;
        telescope = true;
        telescope_borders = true;
      };
    };
  };
}

# 		"catppuccin"
# 		"darcula"
# 		"dracula"
# 		"espresso"
# 		"github"
# 		"google-dark"
# 		"google-light"
# 		"gruvbox-dark-hard"
# 		"gruvbox-dark-medium"
# 		"gruvbox-dark-pale"
# 		"gruvbox-dark-soft"
# 		"gruvbox-light-hard"
# 		"gruvbox-light-medium"
# 		"gruvbox-light-soft"
# 		"material"
# 		"material-darker"
# 		"material-lighter"
# 		"material-palenight"
# 		"material-vivid"
# 		"nord"
# 		"nova"
# 		"ocean"
# 		"onedark"
# 		"rose-pine"
# 		"rose-pine-dawn"
# 		"rose-pine-moon"
# 		"solarized-dark"
# 		"solarized-light"
# 		"tango"
# 		"tokyo-night-dark"
# 		"tokyo-night-light"
# 		"tokyo-night-storm"
# 		"tokyo-night-terminal-dark"
# 		"tokyo-night-terminal-light"
# 		"tokyo-night-terminal-storm"
# 		"woodland"
