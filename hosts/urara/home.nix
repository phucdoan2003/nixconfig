{pkgs, ...}: {
  imports = [
    ../../home-manager/desktop
    ../../home-manager/cli
    ../../home-manager/cli/terminal
    ../../home-manager/cli/utility
    ../../home-manager/development
    ../../home-manager/nixvim
  ];
  home.username = "phuc";
  home.homeDirectory = "/home/phuc";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
