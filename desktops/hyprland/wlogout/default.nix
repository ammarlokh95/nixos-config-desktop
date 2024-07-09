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

  window {
    background-color: rgba(221,238, 255, 0.5);
    background-size: cover;
  }

/* 
----------------------------------------------------- 
Buttons
----------------------------------------------------- 
*/
  button {
    background-repeat: no-repeat;
    background-position: center;
	  background-size: 25%;
    background-color: rgba(12, 12, 12, 0.5);
    border: 3px solid @inactive;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.4);
  }


  button:focus,
  button:active,
  button:hover {
    color: @active;
    background-color: rgba(12, 12, 12, 0.8);
    border: 3px solid @active;
  }
  #lock {
    margin: 10px;
    border-radius: 20px;
  	background-image: image(url("lock.png"));
  }

  #logout {
    margin: 10px;
    border-radius: 20px;
  	background-image: image(url("logout.png"));

  }

    #suspend {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("suspend.png"));
    }

    #hibernate {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("hibernate.png"));
    }

    #shutdown {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("shutdown.png"));
    }

    #reboot {
      margin: 10px;
      border-radius: 20px;
      background-image: image(url("reboot.png"));
    }

'';
  };
}
