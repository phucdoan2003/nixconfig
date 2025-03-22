{
  programs.nixvim.plugins = {
    neo-tree = {
      closeIfLastWindow = true;
      filesystem = {
        bindToCwd = true;
        followCurrentFile = {
          enabled = true;
        };
      };
      window = {
        mappings = {
          l = "open";
        };
      };
    };
  };
}
