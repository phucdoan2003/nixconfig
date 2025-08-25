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
    jdk17
    gcc
    stdenv.cc.cc.lib
    libgcc
    parquet-tools
    jetbrains.idea-ultimate
    godot-mono
    dotnet-sdk
  ];
}
