{pkgs, lib, config, ...}:
  let 
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      #!/usr/bin/env zsh
      echo "Running init"

      # init wallpaper daemon
      swww-daemon &
      swww img ~/Wallpapers/River.png

      # wifi indicator
      nm-applet --indicator &

      waybar &

      dunst &
    '';
  in
  {
  wayland.windowManager.hyprland = {
    
      enable = true;
      settings = {
        "$terminal" = "wezterm";
        "$menu" = "rofi -show drun -show-icons";
        "$mod" = "SUPER";

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

            "$mod, Delete, exec, hyprlock"
            "$mod+SHIFT, Delete, exec, sleep 0.1 && systemctl suspend || loginctl suspend"
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

        exec-once = "bash ~/.config/hypr/start.sh";
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
          '';
      };
    }
