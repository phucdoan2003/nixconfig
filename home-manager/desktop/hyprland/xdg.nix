{pkgs, ...}: {
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-hyprland];
      config = {hyprland.default = ["hyprland"];};
    };
  };
}
