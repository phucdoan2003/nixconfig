{pkgs, ...}: {
  home.packages = with pkgs; [
    prettierd
    stylua
    yamlfmt
  ];
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
        	timeout_ms = 2000;
        };
        formatters_by_ft = {
          lua = ["stylua"];
          nix = ["alejandra"];
          python = ["ruff"];
          javascript = ["prettierd"];
          typescript = ["prettierd"];
          vue = ["prettierd"];
          svelte = ["prettierd"];
          html = ["prettierd"];
          css = ["prettierd"];
          go = ["gofmt"];
          php = ["prettierd"];
          yaml = ["yamlfmt"];
          javascriptreact = ["prettierd"];
          typescriptreact = ["prettierd"];
          c = ["clang-format"];
          cpp = ["clang-format"];
        };
      };
    };
  };
}
