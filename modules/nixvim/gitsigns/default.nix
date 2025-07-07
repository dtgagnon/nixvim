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

      on_attach = helpers.mkRaw # lua
        ''
          function(bufnr)
            local which_key = require("which-key")
            local gitsigns = require("gitsigns")

            which_key.register({
              {
                "[c",
                function()
                  if vim.wo.diff then return "[c" end
                  vim.schedule(function() gitsigns.prev_hunk() end)
                  return "<Ignore>"
                end,
                desc = "Previous hunk"
              },
              {
                "]c",
                function()
                  if vim.wo.diff then return "]c" end
                  vim.schedule(function() gitsigns.next_hunk() end)
                  return "<Ignore>"
                end,
                desc = "Next hunk"
              }
            }, { mode = "n", buffer = bufnr })

            which_key.register({
              { "<leader>h", group = "Git Hunk" },
              { "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
              { "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
              { "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
              { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo Stage Hunk" },
              { "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
              { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
              {
                "<leader>hb",
                function()
                  gitsigns.blame_line { full = true }
                end,
                desc = "Blame Line"
              },
              { "<leader>hd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff" },
              {
                "<leader>hD",
                function()
                  gitsigns.diffthis("~")
                end,
                desc = "Diff (~)"
              },
              { "<leader>t", group = "Toggle" },
              { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Current Line Blame" },
              { "<leader>td", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle Deleted" }
            }, { mode = "n", prefix = "<leader>", buffer = bufnr })
          end
        '';
    };
  };
}
