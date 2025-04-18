{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.home-manager.nixosModules.default
    inputs.stylix.nixosModules.stylix
    inputs.nix-minecraft.nixosModules.minecraft-servers
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix
    ../../modules/virtualisation
    ../../modules/services/syncthing.nix
    ../../modules/services/minecraft.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "fou";
    networkmanager = {
      enable = true;
    };
  };

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services.login.enableGnomeKeyring = true;
  };

  hardware = {
    graphics.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    nvidia.prime = {
      intelBusId = "0@0:2:0";
      nvidiaBusId = "1@:0:0:0";
    };
  };

  stylix = {
    enable = true;
    image = ./cyberpunk-edgerunners.jpg;
    polarity = "dark";
  };

  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    dbus.enable = true;
    blueman.enable = true;
    udisks2.enable = true;
    openssh.enable = true;
  };

  users.users.phuc = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "gamemode" "libvirtd" "adbusers"];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users.phuc = {
      imports = [./home.nix inputs.nixvim.homeManagerModules.nixvim];
    };
  };

  environment = {
    pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];
    systemPackages = with pkgs; [
      xdg-utils
      coreutils
      killall
      vim
      alejandra
      wget
      tree

      util-linux
      vulkan-tools
      exfat

      ffmpeg-full

      #misc
      cabextract
      cifs-utils
      usbutils
      powertop
      google-chrome
      broadcom-bt-firmware
      bluez

      #devops
      git
      docker
      awscli2
      kubectl
      terraform
      ansible
      trivy
      kubernetes-helm
      minikube
      kubernetes
    ];
    variables = {
      # track https://github.com/swaywm/sway/issues/8143
      GTK_IM_MODULE = "fcitx";
    };
  };

  nixpkgs.overlays = [inputs.nix-minecraft.overlay];
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
