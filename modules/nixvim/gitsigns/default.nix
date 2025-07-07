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
      desc = "Previous hunk";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
        end
      '';
    }
    {
      mode = "n";
      key = "]c";
      desc = "Next hunk";
      action = helpers.mkRaw ''
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end
      '';
    }

    # Git hunk operations
    {
      mode = "n";
      key = "<leader>hs";
      desc = "Stage Hunk";
      action = "<cmd>Gitsigns stage_hunk<cr>";
    }
    {
      mode = "n";
      key = "<leader>hr";
      desc = "Reset Hunk";
      action = "<cmd>Gitsigns reset_hunk<cr>";
    }
    {
      mode = "n";
      key = "<leader>hS";
      desc = "Stage Buffer";
      action = "<cmd>Gitsigns stage_buffer<cr>";
    }
    {
      mode = "n";
      key = "<leader>hu";
      desc = "Undo Stage Hunk";
      action = "<cmd>Gitsigns undo_stage_hunk<cr>";
    }
    {
      mode = "n";
      key = "<leader>hR";
      desc = "Reset Buffer";
      action = "<cmd>Gitsigns reset_buffer<cr>";
    }
    {
      mode = "n";
      key = "<leader>hp";
      desc = "Preview Hunk";
      action = "<cmd>Gitsigns preview_hunk<cr>";
    }
    {
      mode = "n";
      key = "<leader>hb";
      desc = "Blame Line";
      action = helpers.mkRaw ''
        function()
          require("gitsigns").blame_line { full = true }
        end
      '';
    }
    {
      mode = "n";
      key = "<leader>hd";
      desc = "Diff";
      action = "<cmd>Gitsigns diffthis<cr>";
    }
    {
      mode = "n";
      key = "<leader>hD";
      desc = "Diff (~)";
      action = helpers.mkRaw ''
        function()
          require("gitsigns").diffthis("~")
        end
      '';
    }

    # Toggle options
    {
      mode = "n";
      key = "<leader>tb";
      desc = "Toggle Current Line Blame";
      action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
    }
    {
      mode = "n";
      key = "<leader>td";
      desc = "Toggle Deleted";
      action = "<cmd>Gitsigns toggle_deleted<cr>";
    }
  ];
}
