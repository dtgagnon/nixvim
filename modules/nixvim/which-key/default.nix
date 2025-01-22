{
  plugins.which-key.enable = true;
  keymaps = [
    {
      mode = [ "n" "v" ];
      action = "<cmd>WhichKey<cr>";
      key = "<leader>?";
      options = {
        desc = "Show available keys";
        silent = true;
        noremap = true;
      };
    }
    # Comment keybindings
    {
      mode = "n";
      key = "gb";
      action = "<cmd>CommentToggleBlockwise<cr>";
      options = {
        desc = "Comment toggle blockwise";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gbc";
      action = "<cmd>CommentToggleCurrentBlock<cr>";
      options = {
        desc = "Comment toggle current block";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gc";
      action = "<cmd>CommentToggleLinewise<cr>";
      options = {
        desc = "Comment toggle linewise";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gcc";
      action = "<cmd>CommentToggleCurrentLine<cr>";
      options = {
        desc = "Comment toggle current line";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gco";
      action = "<cmd>CommentInsertBelow<cr>";
      options = {
        desc = "Comment insert below";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gcO";
      action = "<cmd>CommentInsertAbove<cr>";
      options = {
        desc = "Comment insert above";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "gcA";
      action = "<cmd>CommentInsertEndOfLine<cr>";
      options = {
        desc = "Comment insert end of line";
        silent = true;
        noremap = true;
      };
    }
    # Buffer keybindings
    {
      mode = "n";
      key = "<space>bun";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "Next buffer";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<space>bundo";
      action = "<cmd>BufferUndo<cr>";
      options = {
        desc = "Undo buffer changes";
        silent = true;
        noremap = true;
      };
    }
  ];
}
