{pkgs, lib, config, ...}:
  let 
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      #!/usr/bin/env zsh
      echo "Running init"
      
      # wifi indicator
      ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &

      ${pkgs.waybar}/bin/waybar &

      ${pkgs.dunst}/bin/dunst &

      ${pkgs.udiskie}/bin/udiskie &
    '';

    reloadWaybar = pkgs.pkgs.writeShellScriptBin "waybar-rl" ''
      #!/usr/bin/env zsh
      echo "Reloading waybar"
      killall waybar 
      ${pkgs.waybar}/bin/waybar &
    '';
  in
  {
  wayland.windowManager.hyprland = {
    
      enable = true;
      settings = {
        "$terminal" = "wezterm";
        "$menu" = "rofi -show drun -show-icons";
        "$mod" = "Alt";
        "$w1" = ''hyprctl hyprpaper wallpaper ", ~/Wallpapers/Bonsai-Plant.png"'';
        "$w2" = ''hyprctl hyprpaper wallpaper ", ~/Wallpapers/Sun-Setting-Horizon.png"'';
        general = { 
          gaps_out = 5;
          resize_on_border = true;
          "col.active_border" = "rgba(00C2cfff) rgba(6600e8ff)";
          layout = "dwindle";
        };
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        dwindle = {
          pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true; # You probably want this
        };

        master = {
          mfact =  0.75;
          new_on_top = false;
          };

        bind =
          [
            "$mod, T, exec, $terminal"
            "$mod, Q, killactive,"
            "$mod, R, exec, $menu"

            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"

            "$mod SHIFT, h, movewindow, l"
            "$mod SHIFT, l, movewindow, r"
            "$mod SHIFT, k, movewindow, u"
            "$mod SHIFT, j, movewindow, d"

            # GROUPS  
            "$mod, G, togglegroup"
            "$mod, LEFT, moveintogroup, l"
            "$mod, RIGHT, moveintogroup, r"
            "$mod, UP, moveintogroup, u"
            "$mod, DOWN, moveintogroup, d"
            "$mod SHIFT, LEFT,  moveoutofgroup, l"
            "$mod SHIFT, RIGHT, moveoutofgroup, r"
            "$mod SHIFT, UP,    moveoutofgroup, u"
            "$mod SHIFT, DOWN,  moveoutofgroup, d" 
            "$mod SHIFT, <, changegroupactive"
            "$mod SHIFT, >, changegroupactive"
            
            "$mod, F, togglefloating,"
            "$mod, P, pseudo," #dwindle
            "$mod, Delete, exec, hyprlock"
            "$mod+SHIFT, Delete, exec, sleep 0.1 && systemctl hibernate || loginctl hibernate"
            "$mod, S, exec, hyprshot -m region"
            "$mod SHIFT, W, exec, ${reloadWaybar}/bin/waybar-rl"
         ]
          
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
            builtins.concatLists (builtins.genList
              (
                x:
                let
                  ws =
                    let
                      c = (x + 1) / 10;
                    in
                    builtins.toString (x + 1 - (c * 10));
                in
                [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              )
              10)
          );
        bindm =
          [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

        exec-once = ''${startupScript}/bin/start'';
        monitor = [
          "DP-2, 3440x1440@143.97Hz, 0x0, 1"
          "HDMI-A-1, 2560x1440@143.91Hz, 3440x0, 1"
        ];
        windowrulev2 = [
          "float, class:(pavucontrol)" 
          "float, class:(blueman-manager)"
        ];
        workspace = [
          "1,  default:true, monitor:DP-2" 
          "2,  default:true, monitor:HDMI-A-1" 
        ];
      };
      
      extraConfig = ''
          # window resize
          bind = $mod SHIFT, R, submap, resize
         
          submap = resize
          binde = , l, resizeactive, 10 0
          binde = , h, resizeactive, -10 0
          binde = , k, resizeactive, 0 -10
          binde = , j, resizeactive, 0 10
          bind = , escape, submap, reset
          submap = reset

          # change wallpaper
          bind = $mod SHIFT, W, submap, cwall

          submap = cwall
          binde = , 1, exec, $w1 
          binde = , 2, exec, $w2 
          bind = , escape, submap, reset

          submap = reset
          '';
      };
    }
