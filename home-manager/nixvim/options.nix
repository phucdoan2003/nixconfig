{
  programs.nixvim = {
    clipboard.register = "unnamedplus";
    opts = {
      tabstop = 2;
      shiftwidth = 2;
      relativenumber = true;
    };
  };
}
