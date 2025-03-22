{pkgs, ...}: {
  home.packages = [
    pkgs.playerctl
  ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 25;
        output = [
          "DP-1"
          "eDP-1"
        ];
        spacing = 8;

        modules-left = ["mpris"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["wireplumber" "clock"];

        "hyprland/workspaces" = {
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "active" = "";
            "default" = "";
          };
        };

        "mpris" = {
          format = "{player_icon} {artist} {album} {title}";
          format-paused = "{status_icon} {artist} {album} {title}";
          player-icons = {
            "default" = "▶";
            "mpv " = "🎵";
          };
          status-icons = {
            "paused" = "⏸";
          };
        };
        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A; %B %d, %Y (%R)}  ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            # on-scroll-up = "tz_up";
            # on-scroll-down = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };

        };
        "wireplumber"= {
            format= "{volume}%";
            format-muted= "";
            on-click= "helvum";
            max-volume= 150;
            scroll-step= 0.2;
        };
      };
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 14px;
      }

      #clock {
        background-color: unset;
      }
    '';
  };
}
