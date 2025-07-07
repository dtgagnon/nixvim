{ helpers, ... }:
{
  plugins.comment.enable = true;

  extraConfigLua = ''
    local wk = require("which-key")
    
    -- Register normal mode keymaps
    wk.register({
      g = {
        name = "Comment", -- Group name
        c = { "<cmd>CommentToggleCurrentLine<cr>", "Toggle Comment (Line)" },
        b = { "<cmd>CommentToggleCurrentBlock<cr>", "Toggle Comment (Block)" },
        o = { "<cmd>CommentInsertBelow<cr>", "Comment Insert Below" },
        O = { "<cmd>CommentInsertAbove<cr>", "Comment Insert Above" },
        A = { "<cmd>CommentInsertEndOfLine<cr>", "Comment Insert End of Line" },
      }
    }, { mode = "n" })
    
    -- Register visual mode keymaps
    wk.register({
      g = {
        name = "Comment", -- Group name
        c = { "<cmd>CommentToggle<cr>", "Toggle Comment (Selection)" },
        b = { "<cmd>CommentToggle<cr>", "Toggle Comment (Selection)" },
      }
    }, { mode = "v" })
  '';
}
