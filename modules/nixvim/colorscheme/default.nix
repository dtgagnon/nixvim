{
  lib,
  ...
}:
let
  inherit (lib.spirenix-nvim) themeName;
in
{
  colorschemes.base16 = {
    enable = true;
    setUpBar = false;
    colorscheme = themeName;
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

  ## I don't know what to do with the below section. XXXX.colors doesn't seem to be working.
  extraConfigLuaPost = ''
    do local colors = require("colors.${themeName}")
    	vim.api.nvim_set_hl(0, "WinSeparator", {
    		fg = ${lib.spirenix-nvim.colors."${themeName}".base02}_gui,
    	})
    	vim.api.nvim_set_hl(0, "LspInlayHint", {
    		fg = ${lib.spirenix-nvim.colors."${themeName}".base03}_gui,
    	})
    end
  '';
}
