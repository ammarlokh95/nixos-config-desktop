{
  gr-hardware = {
    orientation = "horizontal";
    modules = ["cpu" "memory" "temperature"];

  };
  cpu = {
    format = "C {usage}" ;
  };
  memory = {
    format = "M {percentage}";
  };
  temperature = {
    format = "T {temperatureC}";
  };

  hypr-workspaces = {
    active-only = true;
    all-outputs = false;
    format = "{name}";
    move-to-monitor = true; 
    on-click = "activate";

    persistent-workspaces = {
      "DP-2" = [1 3 5];
      "HDMI-A-1" = [2 4 6];
    };
  }; 
  
  hypr-window = {
    format = "";
    icon = true;
    };

  pulseaudio = {
    format = "{volume}% {icon}";
    on-click = "pavucontrol";

    format-bluetooth = "{volume}% {icon}";
    format-muted = "";
    format-icons = {
      headphone = "";
      headset = "";
      phone = "";
      phone-muted = "";
      portable = "";
      default = ["" "" "" ""];
    };
    scroll-step = 1;
  };
  

  network = {
      format-wifi = "{signalStrength}% {icon}";
      format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
    };


  bluetooth = {
    format = " {status}";
    format-disabled = "";
    format-off = "";
    interval = 30;
    on-click = "blueman-manager";
    format-no-controller = "";
  };

  clock = {
    format = "{:%H:%M}  ";
    format-alt = "{:%A; %B %d, %Y (%R)}";
    tooltip-format = "<tt><small>{calendar}</small></tt>";
    calendar = {
      mode          = "year";
      mode-mon-col  = 3;
      weeks-pos     = "right";
      on-scroll     = 1;
      format = {
        months =     "<span color='#aa3333'>{}</span>";
        days =       "<span color='#151555'>{}</span>";
        weekdays =   "<span color='#ffcc66'>{}</span>";
        today =      "<span color='#ff6611'><b><u>{}</u></b></span>";
      };
    };
    actions =  {
      on-click-right = "mode";
      on-click-forward = "tz_up";
      on-click-backward = "tz_down";
      on-scroll-up = "shift_up";
      on-scroll-down = "shift_down";
    };
  };

  appmenu = {
    format = "Apps";
    on-click = "rofi -show drun -replace";
    tooltip = false;
  };

  idle_inhibitor= {
    format= "{icon}";
    tooltip= true;
    format-icons={
      activated= "";
      deactivated= "";
    };
    on-click-right = "hyprlock";
  };


}
