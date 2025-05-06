{pkgs, ...}: {
  imports = [
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    postman
    wget
    wl-clipboard
    go
    syncthing
    lmstudio
    obsidian
    lazysql
  ];
}
