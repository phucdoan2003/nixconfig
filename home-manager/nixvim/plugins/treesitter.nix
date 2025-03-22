{
  programs.nixvim.plugins = {
    treesitter = {
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
    };
  };
}
