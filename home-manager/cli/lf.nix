{pkgs, ...}: {
  home.packages = with pkgs; [trash-cli];

  programs.lf = {
    enable = true;
    keybindings = {
      D = "trash";
    };
    commands = {
      trash = "%trash-put $fx";
    };
    settings = {
      ifs = "\n";
      icons = true;
      sixel = true;
    };
    previewer = {
      source = pkgs.writeShellScript "pv.sh" ''
        #!/bin/sh

        case "$(${pkgs.file}/bin/file -Lb --mime-type -- "$1")" in
          image/*)
            ${pkgs.kitty}/bin/kitten icat --transfer-modr file --stdin no "$1" < /dev/null > /dev/tty
            exit 1
            ;;
        esac

        ${pkgs.pistol}/bin/pistol "$1"
      '';
    };
  };

  xdg.configFile = {
    "lf/colors" = {
      enable = true;
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/gokcehan/lf/r32/etc/colors.example";
        hash = "sha256-cYJlXuRjuotQ1aynPG5+UGK2nBBNg/6xRiGs2mBpKeY=";
      };
    };
    "lf/icons" = {
      enable = true;
      source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/gokcehan/lf/r32/etc/icons.example";
        hash = "sha256-PZxDReQhwEeDRvSeLFhjGjRAy+Yc3GTXXL6OLP23gQQ=";
      };
    };
  };
}
