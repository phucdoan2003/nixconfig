{pkgs, ...}: {
  imports = [
    ./plugins
    ./keymaps.nix
    ./autocmds.nix
    ./options.nix
  ];
  home.packages = with pkgs; [
    ripgrep
    fd
  ];
  programs.nixvim = {
    enable = true;
  };
}
