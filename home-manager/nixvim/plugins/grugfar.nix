{
  programs.nixvim.plugins = {
    grug-far = {
      settings = {
        keymaps = {
          replace = {n = "r";};
          syncLocations = {n = "R";};
        };
      };
    };
  };
}
