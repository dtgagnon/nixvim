{ helpers, lib, ... }:

let
  theme = lib.spirenix.theme.nord;

  common_filetypes = [ "dashboard" "NvimTree" "Trouble" ];

  common_separators = {
    component_separators = {
      left = "⋮";
      right = "⋮";
    };
    section_separators = {
      left = "";
      right = "";
    };
  };

  common_symbols = {
    modified = "";
    readonly = "";
    unnamed = " ";
    newfile = " ";
  };

  common_mode = {
    b.bg = theme.nord10;
    c.bg = theme.nord0;
    x.bg = theme.nord0;
    y.bg = theme.nord0;
    z = {
      fg = theme.nord6;
      bg = theme.nord10;
    };
  };

  make_mode = fg_a:
    common_mode // {
      a = {
        fg = fg_a;
        bg = theme.nord6;
        gui = "bold";
      };
    };

  diff_highlight_names = [
    "diff_modified_terminal"
    "diff_modified_inactive"
    "diff_removed_terminal"
    "diff_removed_inactive"
    "diff_modified_replace"
    "diff_modified_command"
    "diff_removed_replace"
    "diff_removed_command"
    "diff_modified_visual"
    "diff_modified_normal"
    "diff_modified_insert"
    "diff_removed_visual"
    "diff_removed_normal"
    "diff_removed_insert"
    "diff_added_terminal"
    "diff_added_inactive"
    "diff_added_replace"
    "diff_added_command"
    "diff_added_visual"
    "diff_added_normal"
    "diff_added_insert"
  ];

  diff_highlights = builtins.listToAttrs (map (name: {
    name = "lualine_b_" + name;
    value = {
      fg = theme.nord6;
      bg = theme.nord10;
    };
  }) diff_highlight_names);

in {
  plugins.lualine = {
    enable = true;

    settings.options = common_separators // {
      globalstatus = true;

      disabled_filetypes = {
        statusline = common_filetypes;
        winbar = common_filetypes;
      };

      ignore_focus = common_filetypes;

      theme = with theme; {
        normal = make_mode nord2;
        insert = make_mode nord10;
        visual = make_mode nord15;
        replace = make_mode nord12;
        inactive = make_mode nord10;
      };
    };

    settings.sections = {
      lualine_a = [
        # Use a Lua function for custom component
        {
          component = helpers.mkRaw ''
            						function()
            							return ""
            						end
                    	'';
        }
      ];
      lualine_b = [
        # Built-in component with an icon
        {
          component = "branch";
          icon = "";
        }
        # Simple built-in component
        "diff"
      ];
      lualine_c = [ "" ];
      lualine_x = [{
        component = "diagnostics";
        update_in_insert = true;
      }];
      lualine_y = [ "" ];
      lualine_z = [
        "%l:%c"
        {
          component = "fileformat";
          icon_only = true;
        }
      ];
    };

    settings.tabline = {
      lualine_a = [ "" ];
      lualine_b = [ "" ];
      lualine_c = [{
        component = "windows";
        symbols = common_symbols;

        windows_color = {
          active = {
            fg = theme.nord6;
            bg = theme.nord10;
          };
          inactive = {
            fg = theme.nord6;
            bg = theme.nord1;
          };
        };

        separator = { right = ""; };
      }];
      lualine_x = [ "" ];
      lualine_y = [ "" ];
      lualine_z = [{
        component = "tabs";

        tabs_color = {
          active = {
            fg = theme.nord6;
            bg = theme.nord10;
          };
          inactive = {
            fg = theme.nord6;
            bg = theme.nord1;
          };
        };

        separator = { left = ""; };
      }];
    };

    settings.winbar = {
      lualine_a = [ "" ];
      lualine_b = [ "" ];
      lualine_c = [
        ""
        {
          # Custom component using Lua functions
          component = helpers.mkRaw ''
            require('nvim-navic').get_location
          '';
          cond = helpers.mkRaw ''
            require('nvim-navic').is_available
          '';
        }
      ];
      lualine_x = [ "" ];
      lualine_y = [ "" ];
      lualine_z = [
        {
          component = "filetype";
          colored = false;
          icon_only = true;

          color = {
            fg = theme.nord0;
            bg = theme.nord6;
          };
        }
        {
          component = "filename";
          file_status = true;
          shorting_target = 25;
          path = 1;
          symbols = common_symbols;

          separator = { left = ""; };

          color = {
            fg = theme.nord6;
            bg = theme.nord10;
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

          color = {
            fg = theme.nord6;
            bg = theme.nord1;
          };
        }
        {
          component = "filename";
          file_status = true;
          path = 1;
          shorting_target = 25;
          symbols = common_symbols;

          separator = { left = ""; };

          color = {
            fg = theme.nord6;
            bg = theme.nord1;
          };
        }
      ];
    };
  };

  highlight = with theme;
    {
      StatusLine = { bg = nord0; };

      lualine_b_windows_active = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_windows_inactive = {
        fg = nord6;
        bg = nord1;
      };
    } // diff_highlights;
}
