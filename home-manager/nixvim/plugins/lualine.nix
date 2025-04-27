{
  programs.nixvim.plugins = {
    lualine = {
      settings = {
        sections = {
          lualine_x = [
            {
              __raw = ''
                {
                  require("noice").api.statusline.mode.get,
                  cond = require("noice").api.statusline.mode.has,
                  color = { fg = "#ff9e64" },
                }
              '';
            }
          ];
        };
      };
    };
  };
}
