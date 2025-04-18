{pkgs, ...}: {
  stylix = {
    polarity = "dark";

    cursor = {
      package = pkgs.vanilla-dmz;

      name = "Vanilla-DMZ";
      size = 32;
    };

    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sansSerif = {
        name = "Inter";
        package = pkgs.inter;
      };

      serif = {
        name = "IBM Plex Serif";
        package = pkgs.ibm-plex;
      };

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };

    targets = {
      fish.enable = false;
      neovim.enable = false;
      nixvim.enable = false;
      btop.enable = false;
      waybar.enable = false;
      wezterm.enable = false;
      bemenu = {
        fontSize = 12;
      };
    };
  };
}
