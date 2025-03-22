{
  imports = [
    ./neotree.nix
    ./conform.nix
    ./lsp.nix
    ./telescope.nix
    ./alpha.nix
    ./style.nix
    ./mini.nix
    ./treesitter.nix
    ./cmp.nix
    ./grugfar.nix
    ./flash.nix
  ];

  programs.nixvim = {
    plugins = {
      which-key.enable = true;
      mini.enable = true;
      grug-far.enable = true;
      snacks.enable = true;
      flash.enable = true;
      alpha.enable = true;
      noice.enable = true;

      cmp.enable = true;

      gitsigns.enable = true;
      gitblame.enable = true;

      lsp.enable = true;
      trouble.enable = true;

      web-devicons.enable = true;
      neo-tree.enable = true;

      telescope.enable = true;

      treesitter.enable = true;
      treesitter-refactor.enable = true;
      ts-autotag.enable = true;

      lualine.enable = true;

      direnv.enable = true;
    };
  };
}
