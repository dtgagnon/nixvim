{ lib, config, ... }:
let
  nvimTheme = config.spirenix.theme;
  themeSet = lib.spirenix.theme.${nvimTheme};
in
{
  colorschemes.base16 = {
    enable = true;
    setUpBar = false;
    colorscheme = themeSet;
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
    		do
    			local colors = require("${themeSet}")
    			vim.api.nvim_set_hl(0, "WinSeparator", {
    				fg = colors."${nvimTheme}2_gui,
    			})
    			vim.api.nvim_set_hl(0, "LspInlayHint", {
    				fg = colors."${nvimTheme}3_gui",
    			})
    		end
    	'';
}
