{
services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = 150;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl hibernate";
          }
        ];
      };
    };
    
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = true;
        splash_offset = 2.0;

        preload = [
          "~/Wallpapers/Sun-Setting-Horizon.png"
          "~/Wallpapers/Bonsai-Plant.png"
        ];

        wallpaper = [
          ",~/Wallpapers/Bonsai-Plant.png"
        ];
      };
    };
  };
}
