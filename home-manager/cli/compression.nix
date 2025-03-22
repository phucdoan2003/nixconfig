{pkgs, ...}: {
  home.packages = with pkgs; [
    gnutar
    zip
    unzip
    p7zip
  ];
}
