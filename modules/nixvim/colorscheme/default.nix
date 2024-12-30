{ lib
, config
, ...
}:
let
  inherit (lib.spirenix-nvim) colors;
in
{
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
}
