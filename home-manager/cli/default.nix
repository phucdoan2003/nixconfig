{pkgs, ...}: {
  imports = [
    ./compression.nix
    ./fish.nix
    ./lf.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    imagemagick
    sops
    mkvtoolnix-cli
    httpie
    tio
  ];

  programs = {
    btop.enable = true;
    fzf.enable = true;
    bat.enable = true;
    eza = {
      enable = true;
      icons = "auto";
    };
    yt-dlp.enable = true;
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    git = {
      enable = true;
      userEmail = "thienphucdoantran@gmail.com";
      userName = "phucdoan2003";
      signing = {
        signByDefault = true;
        key = "~/.ssh/id_ed25519.pub";
      };
      extraConfig = {
        gpg.format = "ssh";
      };
    };
  };
}
