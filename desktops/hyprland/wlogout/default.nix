{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown" ;
        keybind = "s";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        text = "Logout";
        action = "loginctl terminate-user $USER";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = #css
    ''

  @define-color active #DDEEFF;
  @define-color inactive #FFFFFF;


/* 
----------------------------------------------------- 
Buttons
----------------------------------------------------- 
*/

  #lock {
    margin: 10px;
    border-radius: 20px;
  	background-image: image(url("icons/lock.png"));
  }

  #logout {
    margin: 10px;
    border-radius: 20px;
  	background-image: image(url("./icons/logout.png"));

  }

    #suspend {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("./icons/suspend.png"));
    }

    #hibernate {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("./icons/hibernate.png"));
    }

    #shutdown {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("./icons/shutdown.png"));
    }

    #reboot {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("./icons/reboot.png"));
    }

'';
  };
}
