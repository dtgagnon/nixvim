{ lib
, pkgs
, ...
}:
{
  vimAlias = true;
  withNodeJs = true;
  withRuby = true;

  luaLoader.enable = true;

  extraPlugins = with pkgs.vimPlugins; [
    aider-nvim
    vim-bufkill
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    # smartindent = true;
    breakindent = true;
    cursorline = true;

    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    wrap = true;
    linebreak = true;

    number = true;
    relativenumber = true;

    signcolumn = "yes:1";

    mouse = "a";

    foldenable = true;
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldmethod = "syntax";

    updatetime = 50;

    swapfile = false;
    backup = false;
    undofile = true;

    termguicolors = true;

    ignorecase = true;
    smartcase = true;

    splitbelow = true;
    splitright = true;

    scrolloff = 4;

    laststatus = 3;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ch";
      action = "<cmd>noh<cr>";
      options = {
        silent = true;
        desc = "Clear highlight";
      };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = ''<cmd>let @/=""<cr>'';
      options = {
        silent = true;
        desc = "Clear search";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>:BD<cr>";
      options = {
        silent = true;
        desc = "Delete buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>:bnext<cr>";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>:bprevious<cr>";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      mode = "t";
      key = "<C-o>";
      action = "<C-\\><C-n>";
      options = {
        silent = true;
        desc = "Exit terminal mode";
      };
    }
  ];
}
