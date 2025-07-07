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
      options = {
        desc = "Buffer";
      };
    }
    {
      mode = "n";
      key = "<space>bn";
      action = "<cmd>BufferNext<cr>";
      options = {
        desc = "Next buffer";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<space>bu";
      action = "<cmd>BufferUndo<cr>";
      options = {
        desc = "Undo buffer changes";
        silent = true;
        noremap = true;
      };
    }
  ];
}
