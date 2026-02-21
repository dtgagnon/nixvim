{ helpers, ... }:
{
  plugins.comment.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>CommentToggleCurrentLine<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>CommentToggleCurrentBlock<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>CommentInsertBelow<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gO";
      action = "<cmd>CommentInsertAbove<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gA";
      action = "<cmd>CommentInsertEndOfLine<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>gc";
      action = "<cmd>CommentToggle<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>gb";
      action = "<cmd>CommentToggle<cr>";
      options = {
        desc = "Comment";
        silent = true;
      };
    }
  ];
}
    