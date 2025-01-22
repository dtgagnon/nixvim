{ lib
, config
, ...
}:
let
  inherit (lib.spirenix-nvim) colors;
  theme = colors.${config.themeName};
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = {
          normal = {
            a = {
              fg = theme.base05;
              bg = theme.base03;
              gui = "bold";
            };
            b.bg = theme.base01;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base01;
            };
          };
          insert = {
            a = {
              fg = theme.base0B;
              bg = theme.base01;
              gui = "bold";
            };
            b.bg = theme.base01;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base01;
            };
          };
          visual = {
            a = {
              fg = theme.base03;
              bg = theme.base01;
              gui = "bold";
            };
            b.bg = theme.base01;
            c.bg = theme.base00;
            x.bg = theme.base00;
            y.bg = theme.base00;
            z = {
              fg = theme.base06;
              bg = theme.base01;
            };
          };
        };
        globalstatus = true;
        component_separators = {
          left = "⋮";
          right = "⋮";
        };
        section_separators = {
          left = "";
          right = "";
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
                return ""
              end
            '';
          }
        ];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
          }
          {
            __unkeyed = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
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
            __unkeyed = "progress";
          }
          "%l:%c"
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
              modified = " ";
              readonly = " ";
              unnamed = " ";
              newfile = " ";
            };
            windows_color = {
              active = {
                fg = theme.base06;
                bg = theme.base02;
              };
              inactive = {
                fg = theme.base06;
                bg = theme.base01;
              };
            };
            separator = {
              right = "";
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
                bg = theme.base01;
              };
              inactive = {
                fg = theme.base00;
                bg = theme.base01;
              };
            };
            separator = {
              left = "";
            };
          }
        ];
      };

      winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [
          {
            __raw = ''
              function ()
                return require('nvim-navic').get_location()
              end,
            '';
            cond = ''
              function()
                return require('nvim-navic').is_available()
              end
            '';
          }
        ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed = "filetype";
            colored = false;
            icon_only = true;

            color = with theme; {
              fg = base01;
              bg = base06;
            };
          }
          {
            __unkeyed = "filename";
            file_status = true;
            shorting_target = 25;
            path = 1;
            symbols = {
              modified = "";
              readonly = "";
              unnamed = "";
              newfile = "";
            };

            separator = { left = ""; };

            color = with theme; {
              fg = base06;
              bg = base01;
            };
          }
        ];
      };

      settings.inactive_winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            component = "filetype";
            colored = false;
            icon_only = true;

            color = with theme; {
              fg = base04;
              bg = base00;
            };
          }
          {
            __unkeyed = "filename";
            file_status = true;
            path = 1;
            shorting_target = 25;

            separator = { left = ""; };

            color = with theme; {
              fg = base06;
              bg = base01;
            };
          }
        ];
      };
    };
  };
}
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
