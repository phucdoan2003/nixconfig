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
        height = 20;
        spacing = 16;

        modules-left = ["mpris"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["network" "wireplumber" "clock"];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "mpris" = {
          format = " {player_icon} {artist} {album} {title}";
          format-paused = " {status_icon} {artist} {album} {title}";
          player-icons = {
            "default" = "";
            "mpv " = "🎵";
          };
          status-icons = {
            "paused" = "";
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
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        "wireplumber" = {
          format = "{volume}% {icon} ";
          format-muted = " ";
          on-click = "pwvucontrol";
          format-icons = "";
        };
        "network" = {
          format = "{ifname}";
          format-wifi = "{essid}  ";
          format-ethernet = "{ifname}  ";
          format-disconnected = " ";
          tooltip-format = "{ifname} via {gwaddr} 󰊗 ";
          tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
          tooltip-format-ethernet = "{ifname}  ";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
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
