{ lib, config, ... }:
let
  inherit (config.spirenix.module) nvimTheme;
  theme = lib.spirenix.theme.${nvimTheme};
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = {
          normal = {
            a = {
              fg = theme.base02;
              bg = theme.base06;
              gui = "bold";
            };
            b.bg = theme.base0A;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base0A;
            };
          };
          insert = {
            a = {
              fg = theme.base0A;
              bg = theme.base06;
              gui = "bold";
            };
            b.bg = theme.base0A;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base0A;
            };
          };
          visual = {
            a = {
              fg = theme.base0F;
              bg = theme.base06;
              gui = "bold";
            };
            b.bg = theme.base0A;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base0A;
            };
          };
        };
        globalstatus = true;
        component_separators = {
          left = "⋮";
          right = "⋮";
        };
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = [ "dashboard" "NvimTree" "Trouble" ];
          winbar = [ "dashboard" "NvimTree" "Trouble" ];
        };
        ignore_focus = [ "dashboard" "NvimTree" "Trouble" ];
      };
      sections = {
        lualine_a = [
          {
            __raw = ''
              function()
                return ""
              end
            '';
          }
        ];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
          }
          {
            __unkeyed = "diff";
          }
        ];
        lualine_c = [ "" ];
        lualine_x = [
          {
            __unkeyed = "diagnostics";
            update_in_insert = true;
          }
        ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed = "location";
          }
          {
            __unkeyed = "fileformat";
            icon_only = true;
          }
        ];
      };
      tabline = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [
          {
            __unkeyed = "windows";
            symbols = {
              modified = "";
              readonly = "";
              unnamed = " ";
              newfile = " ";
            };
            windows_color = {
              active = {
                fg = theme.base06;
                bg = theme.base0A;
              };
              inactive = {
                fg = theme.base06;
                bg = theme.base01;
              };
            };
            separator = {
              right = "";
            };
          }
        ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed = "tabs";
            tabs_color = {
              active = {
                fg = theme.base06;
                bg = theme.base0A;
              };
              inactive = {
                fg = theme.base06;
                bg = theme.base01;
              };
            };
            separator = {
              left = "";
            };
          }
        ];
      };
    };
  };
}
# }
# let
#   inherit (lib.spirenix) nvimTheme;
#   theme = lib.spirenix.theme.${nvimTheme};
#
#   common_filetypes = [ "dashboard" "NvimTree" "Trouble" ];
#
#   common_separators = {
#     component_separators = {
#       left = "⋮";
#       right = "⋮";
#     };
#     section_separators = {
#       left = "";
#       right = "";
#     };
#   };
#
#   common_symbols = {
#     modified = "";
#     readonly = "";
#     unnamed = " ";
#     newfile = " ";
#   };
#
#   common_mode = with theme; {
#     b.bg = base0A;
#     c.bg = base00;
#     x.bg = base00;
#     y.bg = base00;
#     z = {
#       fg = base06;
#       bg = base0A;
#     };
#   };
#
#   make_mode = fg_a:
#     common_mode // {
#       a = {
#         fg = fg_a;
#         bg = theme.base06;
#         gui = "bold";
#       };
#     };
#
#   diff_highlight_names = [
#     "diff_modified_terminal"
#     "diff_modified_inactive"
#     "diff_removed_terminal"
#     "diff_removed_inactive"
#     "diff_modified_replace"
#     "diff_modified_command"
#     "diff_removed_replace"
#     "diff_removed_command"
#     "diff_modified_visual"
#     "diff_modified_normal"
#     "diff_modified_insert"
#     "diff_removed_visual"
#     "diff_removed_normal"
#     "diff_removed_insert"
#     "diff_added_terminal"
#     "diff_added_inactive"
#     "diff_added_replace"
#     "diff_added_command"
#     "diff_added_visual"
#     "diff_added_normal"
#     "diff_added_insert"
#   ];
#
#   diff_highlights = builtins.listToAttrs (map
#     (name: {
#       name = "lualine_b_" + name;
#       value = with theme; {
#         fg = base06;
#         bg = base0A;
#       };
#     })
#     diff_highlight_names);
#
# in
# {
#   plugins.lualine = {
#     enable = true;
#
#     settings.options = common_separators // {
#       globalstatus = true;
#
#       disabled_filetypes = {
#         statusline = common_filetypes;
#         winbar = common_filetypes;
#       };
#
#       ignore_focus = common_filetypes;
#
#       theme = with theme; {
#         normal = make_mode base02;
#         insert = make_mode base0A;
#         visual = make_mode base0F;
#         replace = make_mode base0C;
#         inactive = make_mode base0A;
#       };
#     };
#
#     settings.sections = {
#       lualine_a = [
#         {
#           component = helpers.mkRaw ''
#             						function()
#             							return ""
#             						end
#                     	'';
#         }
#       ];
#       lualine_b = [
#         {
#           component = "branch";
#           icon = "";
#         }
#         "diff"
#       ];
#       lualine_c = [ "" ];
#       lualine_x = [{
#         component = "diagnostics";
#         update_in_insert = true;
#       }];
#       lualine_y = [ "" ];
#       lualine_z = [
#         "%l:%c"
#         {
#           component = "fileformat";
#           icon_only = true;
#         }
#       ];
#     };
#
#     settings.tabline = {
#       lualine_a = [ "" ];
#       lualine_b = [ "" ];
#       lualine_c = [{
#         component = "windows";
#         symbols = common_symbols;
#
#         windows_color = {
#           active = with theme; {
#             fg = base06;
#             bg = base0A;
#           };
#           inactive = with theme; {
#             fg = base06;
#             bg = base01;
#           };
#         };
#
#         separator = { right = ""; };
#       }];
#       lualine_x = [ "" ];
#       lualine_y = [ "" ];
#       lualine_z = [{
#         component = "tabs";
#
#         tabs_color = {
#           active = with theme; {
#             fg = base06;
#             bg = base0A;
#           };
#           inactive = with theme; {
#             fg = base06;
#             bg = base01;
#           };
#         };
#
#         separator = { left = ""; };
#       }];
#     };
#
#     settings.winbar = {
#       lualine_a = [ "" ];
#       lualine_b = [ "" ];
#       lualine_c = [
#         {
#           component = helpers.mkRaw ''
#             require('nvim-navic').get_location
#           '';
#           cond = helpers.mkRaw ''
#             require('nvim-navic').is_available
#           '';
#         }
#       ];
#       lualine_x = [ "" ];
#       lualine_y = [ "" ];
#       lualine_z = [
#         {
#           component = "filetype";
#           colored = false;
#           icon_only = true;
#
#           color = with theme; {
#             fg = base00;
#             bg = base06;
#           };
#         }
#         {
#           component = "filename";
#           file_status = true;
#           shorting_target = 25;
#           path = 1;
#           symbols = common_symbols;
#
#           separator = { left = ""; };
#
#           color = with theme; {
#             fg = base06;
#             bg = base0A;
#           };
#         }
#       ];
#     };
#
#     settings.inactive_winbar = {
#       lualine_a = [ "" ];
#       lualine_b = [ "" ];
#       lualine_c = [ "" ];
#       lualine_x = [ "" ];
#       lualine_y = [ "" ];
#       lualine_z = [
#         {
#           component = "filetype";
#           colored = false;
#           icon_only = true;
#
#           color = with theme; {
#             fg = base06;
#             bg = base01;
#           };
#         }
#         {
#           component = "filename";
#           file_status = true;
#           path = 1;
#           shorting_target = 25;
#           symbols = common_symbols;
#
#           separator = { left = ""; };
#
#           color = with theme; {
#             fg = base06;
#             bg = base01;
#           };
#         }
#       ];
#     };
#   };
#
#   highlight = {
#     StatusLine = { bg = theme.base00; };
#
#     lualine_b_windows_active = with theme; {
#       fg = base06;
#       bg = base0A;
#     };
#     lualine_b_windows_inactive = with theme; {
#       fg = base06;
#       bg = base01;
#     };
#   } // diff_highlights;
# }
