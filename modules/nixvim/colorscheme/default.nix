{ helpers, ... }: {
  # extraConfigLuaPost = # lua
  #   ''
  #     do
  #       -- The NixVim Nord colorscheme doesn't assign a pleasing color to the window
  #       -- separator by default. Here we override it with a softer color.
  #       local colors = require("nord.colors")
  #       vim.api.nvim_set_hl(0,  "WinSeparator", {
  #         fg = colors.nord2_gui,
  #       })
  #       vim.api.nvim_set_hl(0,  "LspInlayHint", {
  #         fg = colors.nord3_gui,
  #       })
  #     end
  #   '';
  #
  # colorschemes.nord = {
  #   enable = true;
  #   settings = {
  #     borders = true;
  #     contrast = false;
  #     disable_background = false;
  #     enable_sidebar_background = true;
  #   };
  # };
	extraConfigLuaPost = # lua
		''
			do
				local colors = require("everforest.colors")
				vim.api.nvim_set_hl(0, "WinSeparator", {
					fg = colors.everforest2_gui,
				})
				vim.api.nvim_set_hl(0, "LspInlayHint", {
					fg = colors.everforest3_gui,
				})
		'';

  colorschemes.everforest = {
    enable = true;
    settings = {
      borders = true;
      contrast = false;
      disable_background = false;
      enable_sidebar_background = true;
    };
  };
}
