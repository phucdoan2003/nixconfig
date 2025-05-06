{pkgs, ...}: {
  imports = [
    ../../home-manager/desktop
    ../../home-manager/cli
    ../../home-manager/cli/terminal
    ../../home-manager/cli/utility
    ../../home-manager/development
    ../../home-manager/nixvim
  ];
  home.username = "fou";
  home.homeDirectory = "/home/fou";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    discord-canary
    wl-clipboard
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services = {
    udiskie.enable = true;
  };

  programs.home-manager.enable = true;
}
