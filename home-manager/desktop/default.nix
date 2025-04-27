{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./multimedia
    ./hyprland
    # ./sway
    ./fcitx5.nix
    ./thunderbird.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    mullvad-browser
    libreoffice-qt6-fresh
    keepassxc
    mako
    kitty
    wofi
    wlroots
    gtk-layer-shell
    sof-firmware
    alsa-utils
    alsa-firmware
    nvidia-vaapi-driver
    egl-wayland
    pipewire
    pwvucontrol
    obs-studio
  ];

  qt = {
    enable = true;
  };

  programs = {
    firefox = {
      enable = true;
    };
  };
}
