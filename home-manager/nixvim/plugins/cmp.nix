{lib, ...}: {
  programs.nixvim.plugins = {
    cmp = {
      autoEnableSources = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
          preselect = "Item";
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "treesitter";}
        ];
        mapping = lib.mkForce {
          "<CR>" = lib.mkForce ''
            function(fallback)
              if require("cmp").visible() then
                require("cmp").confirm({ select = true })
              else
                fallback()
              end
            end
          '';
          "<C-j>" = lib.mkForce ''
            function(fallback)
              if require("cmp").visible() then
                require("cmp").select_next_item()
              else
                fallback()
              end
            end
          '';
          "<C-k>" = lib.mkForce ''
            function(fallback)
              if require("cmp").visible() then
                require("cmp").select_prev_item()
              else
                fallback()
              end
            end
          '';
          "<C-q>" = lib.mkForce ''
            function(fallback)
              if require("cmp").visible() then
                require("cmp").close()
              else
                fallback()
              end
            end
          '';
        };
      };
    };
  };
}
