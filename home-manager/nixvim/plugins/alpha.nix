{
  programs.nixvim = {
    extraConfigLua = ''
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                ████╗  ███╗  ██╗███████╗████████╗██╗   ██╗██╗███╗   ███╗     ██╗ ████╗
             ████╔══╝  ████╗ ██║██╔════╝██╔═══██║██║   ██║██║████╗ ████║ 　 ██╔╝ ╚══████╗
          ████╔══╝     ██╔██╗██║███████╗██║   ██║██║   ██║██║██╔████╔██║   ██╔╝     ╚══████╗
          ╚══████      ██║╚████║██╔════╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ██╔╝      ████╔══╝
             ╚══████╗  ██║ ╚███║███████╗████████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ██╔╝    ████╔══╝
                ╚═══╝  ╚═╝  ╚══╝╚══════╝╚═══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ╚═╝     ╚═══╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("1", " " .. " University Workspace",       "<cmd> :Neotree ~/Documents/Uni <cr>"),
        dashboard.button("2", " " .. " Projects Workspace",        "<cmd> :Neotree ~/Documents/Projects <cr>"),
        dashboard.button("3", " " .. " Company Workspace",    "<cmd> :Neotree ~/Documents/EDGE <cr>"),
        dashboard.button("4", " " .. " Nixconfig",          "<cmd> :Neotree /nixconfig <cr>"),
        dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8

    '';
    plugins = {
      alpha = {
        theme = "dashboard";
      };
    };
  };
}
