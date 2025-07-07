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

    # Buffer keybindings
    {
      mode = "n";
      key = "<leader>b";
      action = "";  # Empty action for prefix/group
      options = {
        noremap = true;
        silent = true;
        desc = "Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "Next buffer";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>bu";
      action = "<cmd>BufferUndo<cr>";
      options = {
        desc = "Undo buffer changes";
        silent = true;
        noremap = true;
      };
    }
  ];
}
