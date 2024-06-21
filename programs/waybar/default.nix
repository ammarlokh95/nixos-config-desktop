let 
  modules = import ./modules.nix;
  style = import ./style.nix;
in
{
  programs.waybar = {
    enable = true;
    settings = {
      main-bar = {
        position = "top";
        modules-left = ["custom/appmenu" "hyprland/workspaces"];
        modules-center = [  "clock" "hyprland/window"];
        modules-right = [ "idle_inhibitor" "pulseaudio" "network" "bluetooth"  ];
        "group/hardware" = modules.gr-hardware;
        "cpu"= modules.cpu;
        "memory"= modules.memory;
        "temperature" = modules.temperature;
        "hyprland/workspaces" = modules.hypr-workspaces; 
        "hyprland/window" = modules.hypr-window;
        "pulseaudio" = modules.pulseaudio;
        "network"= modules.network;
        "bluetooth" = modules.bluetooth;
        "clock" = modules.clock;
        "custom/appmenu" = modules.appmenu;
        "idle_inhibitor" =  modules.idle_inhibitor;
      };
    };
    style = style.style;
  };
}
