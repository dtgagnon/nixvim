{ lib, ... }:
let
  inherit (lib.spirenix-nvim) themeName;
  theme = lib.spirenix-nvim.colors.${themeName};
in
{
  colorschemes.base16 = {
    enable = true;
    setUpBar = false;
    colorscheme = theme;
    settings = {
      cmp = true;
      illuminate = true;
      indentblankline = true;
      lsp_semantic = true;
      mini_completion = true;
      telescope = true;
      telescope_borders = false;

      # Below is from jake hamilton config, not sure if I want to keep it
      borders = true;
      contrast = false;
      disable_background = false;
      enable_sidebar_background = true;
    };
  };

  extraConfigLuaPost = ''
    		do local colors = require("${themeName}.colors")
    			vim.api.nvim_set_hl(0, "WinSeparator", {
    				fg = colors.theme.base02_gui,
    			})
    			vim.api.nvim_set_hl(0, "LspInlayHint", {
    				fg = colors.theme.base03_gui,
    			})
    		end
    	'';
}
