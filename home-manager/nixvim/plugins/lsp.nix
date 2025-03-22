{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim.plugins.lsp = {
    keymaps.lspBuf = {
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
      "<leader>ca" = "code_action";
    };
    servers = {
      ts_ls = {
        enable = true;
        filetypes = [
          "typescript"
          "javascript"
          "javascriptreact"
          "typescriptreact"
          "vue"
        ];
        extraOptions = {
          init_options = {
            plugins = [
              {
                name = "@vue/typescript-plugin";
                location = "${lib.getBin pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
                languages = ["vue"];
              }
            ];
          };
        };
      };
      eslint.enable = true;
      gopls.enable = true;
      html.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      pylyzer.enable = true;
      ruff.enable = true;
      tailwindcss.enable = true;
      jsonls.enable = true;
      volar.enable = true;
      svelte.enable = true;
    };
  };
}
