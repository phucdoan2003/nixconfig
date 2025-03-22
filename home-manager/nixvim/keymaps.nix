{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        action = "<cmd>Neotree toggle<cr>";
        key = "<leader>e";
        options = {
          silent = true;
        };
      }
      {
        action = "<Esc>";
        key = "kj";
        options = {
          silent = true;
        };
        mode = "i";
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>h";
        key = "<C-h>";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>vsplit<cr>";
        key = "<leader>v";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>split<cr>";
        key = "<leader>h";
        options = {
          silent = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') }, transient = true })<cr>";
        key = "<leader>sR";
        options = {
          silent = true;
          desc = "Search & replace word under cursor in cwd";
        };
        mode = "n";
      }
      {
        action = "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>'), paths = vim.fn.expand('%') }, transient = true })<cr>";
        key = "<leader>sr";
        options = {
          silent = true;
          desc = "Search & replace word under cursor in current buffer";
        };
        mode = "n";
      }
      {
        action = "<cmd>lua require('flash').jump()<cr>";
        key = "s";
        options = {
          silent = true;
        };
        mode = ["n" "x" "o"];
      }
    ];
  };
}
