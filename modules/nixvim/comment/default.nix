{ helpers, ... }:
{
  plugins.comment.enable = true;

  keymaps = [
    {
      mode = "n";
      desc = "Comment";
      key = "<leader>gc";
      action = "<cmd>CommentToggleCurrentLine<cr>";
    }
    {
      mode = "n";
      desc = "Comment";
      key = "<leader>gb";
      action = "<cmd>CommentToggleCurrentBlock<cr>";
    }
    {
      mode = "n";
      desc = "Comment";
      key = "<leader>go";
      action = "<cmd>CommentInsertBelow<cr>";
    }
    {
      mode = "n";
      desc = "Comment";
      key = "<leader>gO";
      action = "<cmd>CommentInsertAbove<cr>";
    }
    {
      mode = "n";
      desc = "Comment";
      key = "<leader>gA";
      action = "<cmd>CommentInsertEndOfLine<cr>";
    }
    {
      mode = "v";
      desc = "Comment";
      key = "<leader>gc";
      action = "<cmd>CommentToggle<cr>";
    }
    {
      mode = "v";
      desc = "Comment";
      key = "<leader>gb";
      action = "<cmd>CommentToggle<cr>";
    }
  ];
}
    