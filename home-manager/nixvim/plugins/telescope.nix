{
  programs.nixvim.plugins = {
    telescope = {
      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
        fzy-native.enable = true;
      };
      keymaps = {
        "<leader><leader>" = {
          action = "find_files";
          options = {
            desc = "Find files in cwd";
          };
        };
        "<leader>sg" = {
          action = "live_grep";
          options = {
            desc = "Fuzzy find in cwd";
          };
        };
        "<leader>sb" = {
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "Fuzzy find in current buffer";
          };
        };
      };
    };
  };
}
