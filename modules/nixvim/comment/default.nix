{ helpers, ... }:
{
  plugins.comment.enable = true;

  extraConfigLua = ''
    require("which-key").register({
      -- Normal Mode
      { "g", group = "Comment", mode = "n" },
      { "gc", "<cmd>CommentToggleCurrentLine<cr>", desc = "Toggle Comment (Line)", mode = "n" },
      { "gb", "<cmd>CommentToggleCurrentBlock<cr>", desc = "Toggle Comment (Block)", mode = "n" },
      { "go", "<cmd>CommentInsertBelow<cr>", desc = "Comment Insert Below", mode = "n" },
      { "gO", "<cmd>CommentInsertAbove<cr>", desc = "Comment Insert Above", mode = "n" },
      { "gA", "<cmd>CommentInsertEndOfLine<cr>", desc = "Comment Insert End of Line", mode = "n" },

      -- Visual Mode
      { "g", group = "Comment", mode = "v" },
      { "gc", "<cmd>CommentToggle<cr>", desc = "Toggle Comment (Selection)", mode = "v" },
      { "gb", "<cmd>CommentToggle<cr>", desc = "Toggle Comment (Selection)", mode = "v" }
    })
  '';
}
