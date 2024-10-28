_:
# let
#   availableThemes = lib.types.enum [
#     "aquarium"
#     "decay"
#     "edge-dark"
#     "everblush"
#     "everforest"
#     "gruvbox"
#     "jellybeans"
#     "mountain"
#     "nord"
#     "oxo-carbon"
#     "paradise"
#     "tokyonight"
#   ];
# in
# {
# options.spirenix-nvim.nixvim = {
#   enable = mkOption {
#     type = types.bool;
#     default = false;
#     description = "Enable custom neovim config'd with nixvim";
#   };
#   themeName = mkOption {
#     type = availableThemes;
#     default = "everforest";
#     description = "Choose the base-16 neovim theme";
#   };
# };
{
  themeName = "everblush";
}
