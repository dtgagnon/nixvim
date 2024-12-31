{ 
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption mkDefault mkForce types;
  inherit (lib.spirenix-nvim) colors;
in
{
  options = {
    themeName = mkOption {
      type = types.enum [
        "everforest"
        "everforest-dark-hard"
        "gruvbox"
        "gruvbox-material-dark-medium"
        "mountain"
        "ocean"
        "tokyo-night"
      ];
      default = "ocean";
      description = "The color theme to use.";
    };
  };

  config = {
    colorschemes.base16 = {
      enable = true;
      setUpBar = false;
      colorscheme = colors.${config.themeName};
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
# 		"catppuccin-frappe"
# 		"catppuccin-latte"
# 		"catppuccin-macchiato"
# 		"catppuccin-mocha"
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