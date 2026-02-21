{ helpers, ... }: {
  plugins.gitsigns = {
    enable = true;

    settings = {
      current_line_blame = true;
      trouble = true; #FIX: config.plugins.trouble.enable errors with "cannot find plugins attr set"

      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "-";
        topdelete.text = "-";
        changedelete.text = "~";
        untracked.text = "┆";
      };
    };
  };

  # Gitsigns keymaps in declarative format
  keymaps = [
    # Navigation between hunks
    {
      mode = "n";
      key = "[c";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Previous hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]c";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end
      '';
      options = {
        desc = "Next hunk";
        silent = true;
      };
    }

    # Git hunk operations
    {
      mode = "n";
      key = "<leader>hs";
      action = "<cmd>Gitsigns stage_hunk<cr>";
      options = {
        desc = "Stage Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hr";
      action = "<cmd>Gitsigns reset_hunk<cr>";
      options = {
        desc = "Reset Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hS";
      action = "<cmd>Gitsigns stage_buffer<cr>";
      options = {
        desc = "Stage Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hu";
      action = "<cmd>Gitsigns undo_stage_hunk<cr>";
      options = {
        desc = "Undo Stage Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hR";
      action = "<cmd>Gitsigns reset_buffer<cr>";
      options = {
        desc = "Reset Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hp";
      action = "<cmd>Gitsigns preview_hunk<cr>";
      options = {
        desc = "Preview Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hb";
      action = helpers.mkRaw ''
        function()
          require("gitsigns").blame_line { full = true }
        end
      '';
      options = {
        desc = "Blame Line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hd";
      action = "<cmd>Gitsigns diffthis<cr>";
      options = {
        desc = "Diff";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>hD";
      action = helpers.mkRaw ''
        function()
          require("gitsigns").diffthis("~")
        end
      '';
      options = {
        desc = "Diff (~)";
        silent = true;
      };
    }

    # Toggle options
    {
      mode = "n";
      key = "<leader>tb";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      options = {
        desc = "Toggle Current Line Blame";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>Gitsigns toggle_deleted<cr>";
      options = {
        desc = "Toggle Deleted";
        silent = true;
      };
    }
  ];
}
